Return-Path: <linux-usb+bounces-3928-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A1D80AEA7
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 22:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDC09281B10
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 21:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D75C57890;
	Fri,  8 Dec 2023 21:14:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mp-relay-02.fibernetics.ca (mp-relay-02.fibernetics.ca [208.85.217.137])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C9CA9
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 13:14:38 -0800 (PST)
Received: from mailpool-fe-01.fibernetics.ca (mailpool-fe-01.fibernetics.ca [208.85.217.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mp-relay-02.fibernetics.ca (Postfix) with ESMTPS id 40E9876226;
	Fri,  8 Dec 2023 21:14:37 +0000 (UTC)
Received: from localhost (mailpool-mx-01.fibernetics.ca [208.85.217.140])
	by mailpool-fe-01.fibernetics.ca (Postfix) with ESMTP id 39C22231A0;
	Fri,  8 Dec 2023 21:14:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.199
X-Spam-Level:
Received: from mailpool-fe-01.fibernetics.ca ([208.85.217.144])
	by localhost (mail-mx-01.fibernetics.ca [208.85.217.140]) (amavisd-new, port 10024)
	with ESMTP id qnQPfrU1qpLk; Fri,  8 Dec 2023 21:14:36 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-209-188.dyn.295.ca [104.157.209.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail.ca.inter.net (Postfix) with ESMTPSA id B391F231A1;
	Fri,  8 Dec 2023 21:14:36 +0000 (UTC)
Message-ID: <81a04236-de8c-423e-ad8c-c74d7ff5ecba@interlog.com>
Date: Fri, 8 Dec 2023 16:14:35 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: dgilbert@interlog.com
Subject: Re: [Announce] lsucpd release 0.91 utility for USB Type-C
Content-Language: en-CA
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <5f74a231-e0c2-4be6-ab90-6592f7cfa8df@interlog.com>
 <2023120804-chowder-sampling-8ebb@gregkh>
From: Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <2023120804-chowder-sampling-8ebb@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/8/23 02:16, Greg KH wrote:
> On Fri, Dec 08, 2023 at 01:36:02AM -0500, Douglas Gilbert wrote:
>> lsucpd is a command line utility for listing USB Type-C ports, partners
>> and any associated PD objects. It is essentially data-mining the
>> /sys/class/typec and /sys/class/usb_power_delivery directories. So
>> lsucpd performs no magic and root permissions are not required.
>>
>> lsucpd was originally announced in this post on 28 August 2023:
>>    https://marc.info/?l=linux-usb&m=169325926403279&w=2
>> That code has been tagged as 'r0.89'. There is also a 'r0.90' tag
>> but it was not announced. This release is tagged as 'r0.91'. The
>> code is available at this git mirror at:
>>      https://github.com/doug-gilbert/lsucpd
>>
>> Changelog since 0.89 [20230827] [svn: r9]
>>    - add the first stage of JSON support
>>    - add --pdo-snk= and --pdo-src= options to decode PDOs
>>    - add --rdo= option to decode RDOs
>>    - make preparations for PD revision 3.2
> 
> Nice!  Any thoughts about adding this functionality to the usbutils
> package to make it all in one place?

Well that should be a medium term goal. However currently the environment in
which lsucpd works is far from ideal.

The main problem is the dubious nature of some of the information provided
(via UCSI_ACPI in my case). For my Thinkpad X13 Gen3 either Intel or Lenovo
have screwed up but since that design is 18 months old my guess is those
companies won't do anything about it, only fixing serious security issues.
Maybe they will fix UCSI_ACPI properly in future models. Some other recent
laptops I have tested (less than 12 months old) don't support UCSI_ACPI at
all. Also the design of /sys/class/power_supply isn't a good fit for USB PD.
Not sure how that could be solved. Heikki sounded off about design issues in:
    https://marc.info/?l=linux-usb&m=169278141600478&w=2
Maybe USB PD needs its own power_supply class or at least a class that
is higher level than class/typec and class/usb-power_delivery.

A secondary problem is that I chose to implement lsucpd in C++20 and later
found out that g++ and clang were bending the truth when they said they
supported C++20. std::print is one area of non-compliance. Hopefully this
will improve in time for the next LTS cycle of major distributions.

Doug Gilbert




