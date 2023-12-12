Return-Path: <linux-usb+bounces-4006-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8BA80E355
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 05:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF51A282D88
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 04:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF14BBA55;
	Tue, 12 Dec 2023 04:33:28 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B99DBF
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 20:33:23 -0800 (PST)
Received: from [192.168.0.224] (ip5f5aee94.dynamic.kabel-deutschland.de [95.90.238.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1A68061E5FE04;
	Tue, 12 Dec 2023 05:33:06 +0100 (CET)
Message-ID: <d5eb3cd6-763e-4dce-bbb6-3af0e96077db@molgen.mpg.de>
Date: Tue, 12 Dec 2023 05:33:05 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Test USB Type-C port?
Content-Language: en-US
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
References: <7ac2c860-3ee4-4431-b52b-904cafd7f213@molgen.mpg.de>
 <ZVy3wnSc0i4jGYh2@kuha.fi.intel.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <ZVy3wnSc0i4jGYh2@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Heikki,


Thank you for your reply.

Am 21.11.23 um 14:59 schrieb Heikki Krogerus:

> On Tue, Nov 21, 2023 at 12:30:34AM +0100, Paul Menzel wrote:
>> To test a USB Type-C port for conformance to the specification, is it
>> possible to connect two Linux devices using a USB Type-C cable, and run some
>> programs on each?US
>>
>> (I started using a Dell XPS 13 9360 from 2016, and sometimes experience
>> troubles with USB Type-C adapters/port replicators and want to verify that
>> the USB Type-C port works according to the specification.)
> 
> Unfortunately USB Type-C is handled in firmware on those computers. We
> can only query the status of some basic things using an interface
> called UCSI, but most details are completely hidden from the
> operating system.

Interesting. Although now not necessary Linux kernel related, there 
should be such test frameworks to test such a port “for compliance”. Can 
you recommend the one you or Intel are using?

> There have been a lot of problems with the UCSI interface on older XPS
> 13 and Latitude systems. Some of those problems have a workaround in
> the driver, but not everything.

Do you know, how Microsoft Windows handles these problems? Also with quirks?


Kind regards,

Paul

