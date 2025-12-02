Return-Path: <linux-usb+bounces-31113-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D81C9CAC7
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 19:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD82C3A7065
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 18:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807322D192B;
	Tue,  2 Dec 2025 18:44:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from d.mail.sonic.net (d.mail.sonic.net [64.142.111.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41282222B2;
	Tue,  2 Dec 2025 18:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.142.111.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764701079; cv=none; b=rMQAxor9EFD4t+p/DZO/1JcdR7DLkhNzVm2dcXeA1CUWJUOzg7y+mev5/4mnmXE7VeNVu80iAaq0Cwf5s6cvluJOsfLaET7OB8KtGcTCV7j8WAEgYmO/y6ZNa4YXjI8KNcYu4VMaVbFKb+FYt7rYnHy4tociZWDSQfSyxMxsld0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764701079; c=relaxed/simple;
	bh=axbabiHu+qrZLDRpfBChHFwcLbb45376mHfN7OucHgc=;
	h=From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=qMzRzbmiXNHVouwulEMNicauDItNESSRihx3Eb4f8AVE2AkRQ1yCtsIQEjRR2CnZi+uAIVLw+4tUJEvxUeHLQBqcmcF7dRas/+cXKat2NehrG4deVFjIBq0p5+61xhkD2re60NXNiQqi2a4Mthm9AKEH+jMEAk/ObvgZrfUJ5LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa; spf=pass smtp.mailfrom=gaga.casa; arc=none smtp.client-ip=64.142.111.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaga.casa
Received: from 192-184-191-52.static.sonic.net (192-184-191-52.static.sonic.net [192.184.191.52])
	(authenticated bits=0)
	by d.mail.sonic.net (8.16.1/8.16.1) with ESMTPA id 5B2IiHiw008256;
	Tue, 2 Dec 2025 10:44:17 -0800
From: Forest <forestix@gaga.casa>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after running adb
Date: Tue, 02 Dec 2025 10:44:17 -0800
Message-ID: <7gcuiktbbd7vharjdl7gbpjqgk6dd0kibb@sonic.net>
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net> <cc788286-c327-4b1f-adb4-8494c0145d74@linux.intel.com> <bu3vhk5i8pttoi6t8fan58lpe7l2eb12ib@sonic.net>
In-Reply-To: <bu3vhk5i8pttoi6t8fan58lpe7l2eb12ib@sonic.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVYeTWDJJY0Ur0RZ2Bc6gHYPS91OkMnO9FAVlKEiCiWOjT2uDPjnHigGCPtxmhCW8uKbaO32ltgDzVZvdcmWy2x4
X-Sonic-ID: C;kIxh6K7P8BGMPbo7kIO7Ng== M;nGtx6K7P8BGMPbo7kIO7Ng==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

On Thu, 20 Nov 2025 14:04:45 -0800, Forest wrote:

>On Tue, 18 Nov 2025 11:21:18 +0200, Mathias Nyman wrote:
>
>>If the bisected patch is the issue then disabling runtime suspend could help.
>>For all usb* roothubs:
>>
>>echo on > /sys/bus/usb/devices/usb*/power/control
>>
>>Does it affect anything?
>
>Yes. After setting all of those to 'on', I have been unable to
>reproduce the freeze. Tested for nearly 12 hours so far, so I think
>it does avoid the problem. (I'll do some more testing and report
>back if that changes.)

I've now tested this workaround for about 36 hours with no freeze. 
Looks to me like the bisected commit is indeed the source of the bug.

