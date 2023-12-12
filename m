Return-Path: <linux-usb+bounces-4008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DC480E3F4
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 06:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71BE81C21ABE
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 05:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B44F156CE;
	Tue, 12 Dec 2023 05:44:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mp-relay-01.fibernetics.ca (mp-relay-01.fibernetics.ca [208.85.217.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A11A9199B
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 21:44:10 -0800 (PST)
Received: from mailpool-fe-01.fibernetics.ca (mailpool-fe-01.fibernetics.ca [208.85.217.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mp-relay-01.fibernetics.ca (Postfix) with ESMTPS id 33EAEE0D77;
	Tue, 12 Dec 2023 05:44:09 +0000 (UTC)
Received: from localhost (mailpool-mx-01.fibernetics.ca [208.85.217.140])
	by mailpool-fe-01.fibernetics.ca (Postfix) with ESMTP id 2C408237EA;
	Tue, 12 Dec 2023 05:44:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.199
X-Spam-Level:
Received: from mailpool-fe-01.fibernetics.ca ([208.85.217.144])
	by localhost (mail-mx-01.fibernetics.ca [208.85.217.140]) (amavisd-new, port 10024)
	with ESMTP id sasTpXBENmFb; Tue, 12 Dec 2023 05:44:08 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-209-188.dyn.295.ca [104.157.209.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail.ca.inter.net (Postfix) with ESMTPSA id A539B237E8;
	Tue, 12 Dec 2023 05:44:08 +0000 (UTC)
Message-ID: <247884f3-a425-4597-9690-98f52713353f@interlog.com>
Date: Tue, 12 Dec 2023 00:44:04 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: dgilbert@interlog.com
Subject: Re: [Announce] lsucpd release 0.91 utility for USB Type-C
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-usb@vger.kernel.org
References: <5f74a231-e0c2-4be6-ab90-6592f7cfa8df@interlog.com>
 <2914483.e9J7NaK4W3@steina-w>
Content-Language: en-CA
From: Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <2914483.e9J7NaK4W3@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/23 10:07, Alexander Stein wrote:
> Hi Douglas,
> 
> Am Freitag, 8. Dezember 2023, 07:36:02 CET schrieb Douglas Gilbert:
>> lsucpd is a command line utility for listing USB Type-C ports, partners
>> and any associated PD objects. It is essentially data-mining the
>> /sys/class/typec and /sys/class/usb_power_delivery directories. So
>> lsucpd performs no magic and root permissions are not required.
>>
>> lsucpd was originally announced in this post on 28 August 2023:
>>     https://marc.info/?l=linux-usb&m=169325926403279&w=2
>> That code has been tagged as 'r0.89'. There is also a 'r0.90' tag
>> but it was not announced. This release is tagged as 'r0.91'. The
>> code is available at this git mirror at:
>>       https://github.com/doug-gilbert/lsucpd
> 
> What is the actual license? There is LICENSE (BSP-2-Clause) and COPYING
> (GPL-2.0-or-later).

Yes, it was a mess. There are license entries all over the place (e.g.
source files, manpages, rpm spec files and debian/copyright). My
intention was to have a BSP-2-Clause license.

Put up new commit on github to align as many locations as I could find
to BSP-2-Clause license.

Thanks for pointing out the inconsistency, cleaned up some of my other
packages that had a similar issue.

Doug Gilbert

<snip>


