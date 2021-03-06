# DO NOT EDIT THIS FILE -- OPNsense auto-generated file
{% if helpers.exists('OPNsense.ftpproxy.ftpproxies.ftpproxy') %}
ftpproxy_enable="YES"
{% set Instances=[] %}
{%  for ftpproxy in helpers.toList('OPNsense.ftpproxy.ftpproxies.ftpproxy') %}
{%   if ftpproxy.enabled|default('0') == '1' %}
{%    set Parameters=[] %}
{%    do Parameters.append("-b " ~ ftpproxy.listenaddress) %}
{%    do Parameters.append("-p " ~ ftpproxy.listenport) %}
{%    if ftpproxy.sourceaddress %}
{%     do Parameters.append("-a " ~ ftpproxy.sourceaddress) %}
{%    endif %}
{%    if ftpproxy.rewritesourceport|default('0') == '1' %}
{%     do Parameters.append("-r") %}
{%    endif %}
{%    if ftpproxy.idletimeout|default('86400') != '86400' %}
{%     do Parameters.append("-t " ~ ftpproxy.idletimeout) %}
{%    endif %}
{%    if ftpproxy.maxsessions|default('100') != '100' %}
{%     do Parameters.append("-m " ~ ftpproxy.maxsessions) %}
{%    endif %}
{%    if ftpproxy.reverseaddress %}
{%     do Parameters.append("-R " ~ ftpproxy.reverseaddress) %}
{%     if ftpproxy.reverseport|default('21') != '21' %}
{%      do Parameters.append("-P " ~ ftpproxy.reverseport) %}
{%     endif %}
{%    endif %}
{%    if ftpproxy.logconnections|default('0') == '1' %}
{%     do Parameters.append("-v") %}
{%    endif %}
{%    if ftpproxy.debuglevel|default('5') != '5' %}
{%     do Parameters.append("-D " ~ ftpproxy.debuglevel) %}
{%    endif %}
ftpproxy_id{{loop.index}}="{% for Parameter in Parameters %} {{Parameter}}{% endfor %}"
{%     do Instances.append(loop.index) %}
{%   endif %}
{%  endfor %}
ftpproxy_instances="{% for Instance in Instances %} {{"id" ~ Instance}}{% endfor %}"
{% endif %}
