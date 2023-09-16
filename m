Return-Path: <linux-usb+bounces-222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D57A2BEF
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 02:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1256B1C22BB5
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 00:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2696210E4;
	Sat, 16 Sep 2023 00:25:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CD9367
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 00:25:03 +0000 (UTC)
Received: from mp-relay-01.fibernetics.ca (mp-relay-01.fibernetics.ca [208.85.217.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2986D3A86
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 17:21:04 -0700 (PDT)
Received: from mailpool-fe-01.fibernetics.ca (mailpool-fe-01.fibernetics.ca [208.85.217.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mp-relay-01.fibernetics.ca (Postfix) with ESMTPS id 83840E1883
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 00:16:19 +0000 (UTC)
Received: from localhost (mailpool-mx-02.fibernetics.ca [208.85.217.141])
	by mailpool-fe-01.fibernetics.ca (Postfix) with ESMTP id 7C06E4414F
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 00:16:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.2
X-Spam-Level:
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailpool-fe-01.fibernetics.ca ([208.85.217.144])
	by localhost (mail-mx-02.fibernetics.ca [208.85.217.141]) (amavisd-new, port 10024)
	with ESMTP id 1689nPXziuu6 for <linux-usb@vger.kernel.org>;
	Sat, 16 Sep 2023 00:16:19 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-209-188.dyn.295.ca [104.157.209.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail.ca.inter.net (Postfix) with ESMTPSA id 1D98E4414B
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 00:16:19 +0000 (UTC)
Message-ID: <70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com>
Date: Fri, 15 Sep 2023 20:16:18 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Reply-To: dgilbert@interlog.com
Content-Language: en-CA
From: Douglas Gilbert <dgilbert@interlog.com>
Subject: device present in lsusb, disappears in lsusb -t
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

The device in question is this one:
   Bus 005 Device 015: ID 0483:572b STMicroelectronics STEVAL-USBC2DP Type-C to 
DisplayPort adapter. It is a USB-C alternate mode device (so tbtadm does not
report it).

That adapter is connected to a screen (and working) and to a USB-C port on
a Lenovo TB3 dock [40AN] which in turn is connected to a Thinkpad X13 Gen3's
USB-C port. The Thinkpad is running lk 6.6.0-rc1 with "lsusb (usbutils) 014".

The strange thing is that this device is nowhere to be found in the output
of "lsusb -t". The lsusb manpage describes the '-t' option as: "Tells
lsusb to dump the physical USB device hierarchy as a tree." So is 'physical'
a weasel word in this context, or is there a bug in the '-t' option, or is
there some other explanation?

Doug Gilbert

