Return-Path: <linux-usb+bounces-3886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB65809C8C
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 07:42:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F29A1C20BC1
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 06:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2163E63AF;
	Fri,  8 Dec 2023 06:42:29 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 377 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Dec 2023 22:42:21 PST
Received: from mp-relay-01.fibernetics.ca (mp-relay-01.fibernetics.ca [208.85.217.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E021722
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 22:42:21 -0800 (PST)
Received: from mailpool-fe-02.fibernetics.ca (mailpool-fe-02.fibernetics.ca [208.85.217.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mp-relay-01.fibernetics.ca (Postfix) with ESMTPS id 56980E0F97
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 06:36:03 +0000 (UTC)
Received: from localhost (mailpool-mx-02.fibernetics.ca [208.85.217.141])
	by mailpool-fe-02.fibernetics.ca (Postfix) with ESMTP id 4DC6560BE2
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 06:36:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.199
X-Spam-Level:
Received: from mailpool-fe-02.fibernetics.ca ([208.85.217.145])
	by localhost (mail-mx-02.fibernetics.ca [208.85.217.141]) (amavisd-new, port 10024)
	with ESMTP id IF5Mxc_bIezw for <linux-usb@vger.kernel.org>;
	Fri,  8 Dec 2023 06:36:02 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-209-188.dyn.295.ca [104.157.209.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail.ca.inter.net (Postfix) with ESMTPSA id 7D85C6043E
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 06:36:02 +0000 (UTC)
Message-ID: <5f74a231-e0c2-4be6-ab90-6592f7cfa8df@interlog.com>
Date: Fri, 8 Dec 2023 01:36:02 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Douglas Gilbert <dgilbert@interlog.com>
Subject: [Announce] lsucpd release 0.91 utility for USB Type-C
Reply-To: dgilbert@interlog.com
To: linux-usb@vger.kernel.org
Content-Language: en-CA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

lsucpd is a command line utility for listing USB Type-C ports, partners
and any associated PD objects. It is essentially data-mining the
/sys/class/typec and /sys/class/usb_power_delivery directories. So
lsucpd performs no magic and root permissions are not required.

lsucpd was originally announced in this post on 28 August 2023:
   https://marc.info/?l=linux-usb&m=169325926403279&w=2
That code has been tagged as 'r0.89'. There is also a 'r0.90' tag
but it was not announced. This release is tagged as 'r0.91'. The
code is available at this git mirror at:
     https://github.com/doug-gilbert/lsucpd

Changelog since 0.89 [20230827] [svn: r9]
   - add the first stage of JSON support
   - add --pdo-snk= and --pdo-src= options to decode PDOs
   - add --rdo= option to decode RDOs
   - make preparations for PD revision 3.2

The last one is a bit optimistic as the kernel PD stack can't yet handle
the additions in PD 3.1 (e.g. fixed 28, 36 and 48 Volts, plus AVS from
15 to 48 Volts). Recently PD 3.1 dropped all support for 3.3 to < 5 Volts.
PD 3.2 splits AVS (Adjustable Voltage Supply) into SPR (Standard Power
Range [<= 21 Volts]) and EPR (Extended ...) variants. SPR AVS is the new
one going from 9 to 20 Volts. What is the difference between AVS and PPS
(Programmable PS)? Answer: PPS does current limiting, AVS doesn't ***.


Note: USB TypeC/PD standards have been in place for almost 10 years
and now almost all new mobile devices use TypeC/PD . However visibility
of TypeC/PD to host operating systems is relatively new and immature.
Previously mobile devices handled TypeC/PD in their BIOS or Embedded
Controllers and left the host OS "in the dark".
Please keep this in mind if reporting issues.

Here is a debian binary package built on Ubuntu 23.10 :
     https://doug-gilbert.github.io/p/lsucpd_0.91-0.1_amd64.deb

Here is a rpm built on Fedora 39 :
     https://doug-gilbert.github.io/p/lsucpd-0.91-1.x86_64.rpm

Doug Gilbert


*** "current limiting" as defined by PPS. AVS (and PPS) still does
      OCP (Over Current Protection) but that is pretty brutal (i.e.
      the source removes power for a few hundred milliseconds to
      let the sink cool off)


Examples from a Thinkpad X13 Gen 3, U 23.10 lk 6.7.0-rc1
   [port0-partner: is an alternate mode DP dongle,
    port1-partner: is a PD power adapter (source)]

$ lsucpd
  port0 [pd0]  ====>>  partner [pd3]
  port1 [pd1]  <<====  partner [pd2]

$ lsucpd -c
  port0 [pd0]  ====>>  partner [pd3]
  port1 [pd1]  <<====  partner [pd2]

 > pd0: has NO source-capabilities
 >  pd0: sink-capabilities:
    >> 1:fixed_supply; fixed: 5.00 Volts, 3.00 Amps (op)
    >> 2:variable_supply; variable: 5.00 to 20.00 Volts, 3.25 Amps (op)
    >> 3:battery; battery: 5.00 to 20.00 Volts, 65.00 Watts (op)
 > pd1: source-capabilities:
   >> 1:fixed_supply; fixed: 0.00 Volts, 7.21 Amps (max)
 >  pd1: sink-capabilities:
    >> 1:fixed_supply; fixed: 5.00 Volts, 3.00 Amps (op)
    >> 2:variable_supply; variable: 5.00 to 20.00 Volts, 3.25 Amps (op)
    >> 3:battery; battery: 5.00 to 20.00 Volts, 65.00 Watts (op)
 > pd2: source-capabilities:
   >> 1:fixed_supply; fixed: 5.00 Volts, 3.00 Amps (max)
   >> 2:fixed_supply; fixed: 9.00 Volts, 3.00 Amps (max)
   >> 3:fixed_supply; fixed: 12.00 Volts, 3.00 Amps (max)
   >> 4:fixed_supply; fixed: 15.00 Volts, 3.00 Amps (max)
   >> 5:fixed_supply; fixed: 20.00 Volts, 3.00 Amps (max)
 >  pd2: has NO sink-capabilities
 > pd3: has NO source-capabilities
 >  pd3: has NO sink-capabilities

$ lsucpd -ll
  port0 [pd0]  ====>>  partner [pd3]
  port1 [pd1]  <<====  partner [pd2]

 > port0  [pd0]:
       data_role='[host] device'
       power_operation_mode='usb_power_delivery'
       power_role='[source] sink'
       preferred_role=''
       supported_accessory_modes='none'
       usb_power_delivery_revision='2.0'
       usb_typec_revision='1.0'
       vconn_source='no'
       waiting_for_supplier='0'
    port0-partner  [pd3]:
       accessory_mode='none'
       number_of_alternate_modes='1'
       supports_usb_power_delivery='yes'
       usb_power_delivery_revision='0.0'
       Alternate mode: /sys/class/typec/port0-partner/port0-partner.0
         active='yes'
         description='DisplayPort'
         mode='1'
         svid='ff01'
         vdo='0x00001085'
 > port1  [pd1]:
       data_role='host [device]'
       power_operation_mode='usb_power_delivery'
       power_role='source [sink]'
       preferred_role=''
       supported_accessory_modes='none'
       usb_power_delivery_revision='2.0'
       usb_typec_revision='1.0'
       vconn_source='no'
       waiting_for_supplier='0'
    port1-partner  [pd2]:
       accessory_mode='none'
       supports_usb_power_delivery='yes'
       usb_power_delivery_revision='0.0'


Note: not all that output is believable (e.g. '0.00 Volts, 7.21 Amps (max)')
so some common sense is required interpreting the output from lsucpd .


