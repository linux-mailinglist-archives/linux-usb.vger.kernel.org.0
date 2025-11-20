Return-Path: <linux-usb+bounces-30784-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AE4C7677D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 23:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A21413589ED
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 22:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8219261574;
	Thu, 20 Nov 2025 22:18:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from c.mail.sonic.net (c.mail.sonic.net [64.142.111.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D1182B7;
	Thu, 20 Nov 2025 22:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.142.111.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763677093; cv=none; b=tyyngZ+WwZTIq0Fuj7uMf4Fg+ZoJmBoNsoEarG0zJLkvqe5qvnke6jLzYlnsz8SPqoAdMxxd6wxzmB0lS1NvPqE1iHadIYrqxadXFZNGt+KO+UVfloP9ATKrWiHq+BkusLsgUz7bzb5cgJ7T7al6RLURaw0FfOECeENyulAEsik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763677093; c=relaxed/simple;
	bh=6NZ8hfQdiDV6YJ59/mWTTh7Uav7Ia1Kn+9Ivuu1MQ/U=;
	h=From:To:Cc:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=ggwkQnYy3LjBsHnz7DoOp9mvEXffVunr9qPI8yIKbDf9aJruniPLBOyz6h5vHQRaFozlMIxQyIvY75mK2NKy8gog4c/r6ESz24uuZtpL1010sWSfg6TGbd/3akeo0CrF3xloSkWCrRpHmmY2qBBQQHf2XKOekRv/TeblXVWdvao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa; spf=pass smtp.mailfrom=gaga.casa; arc=none smtp.client-ip=64.142.111.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gaga.casa
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaga.casa
Received: from 192-184-188-224.static.sonic.net (192-184-188-224.static.sonic.net [192.184.188.224])
	(authenticated bits=0)
	by c.mail.sonic.net (8.16.1/8.16.1) with ESMTPA id 5AKMI0TD024085;
	Thu, 20 Nov 2025 14:18:00 -0800
From: Forest <forestix@gaga.casa>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after running adb
Date: Thu, 20 Nov 2025 14:18:00 -0800
Message-ID: <3e4vhklrg4692n7hbh0pnrlhjkva68mk5v@sonic.net>
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net> <20251118105929.330f0042.michal.pecio@gmail.com>
In-Reply-To: <20251118105929.330f0042.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Sonic-CAuth: UmFuZG9tSVbC7wKBTIz7YzfzUQuSquhcS/MOOLPaGiucCfRSzk1sHuFHfU4EXpghifPU7sX5DXoZ8FYbK/5yz0snaNJs7IBF
X-Sonic-ID: C;KBloxl7G8BGFaq76uCp4aA== M;JKh4xl7G8BGFaq76uCp4aA==
X-Spam-Flag: No
X-Sonic-Spam-Details: 0.0/5.0 by cerberusd

On Tue, 18 Nov 2025 10:59:29 +0100, Michal Pecio wrote:

>If this is caused by running some demon without much hardware connected
>(besides hubs, I guess), I wonder if it might be useful to run strace on
>that thing to see what it is even doing to trigger this crash.

# strace -p 2862
strace: Process 2862 attached
gettid()                                = 2862
epoll_wait(6,

>How can you know nothing is logged if the machine becomes unresponsive?

By watching the output of `stdbuf -o0 dmesg --follow` when it happens.

Same results in a GUI terminal, a text console, and output redirected to
a `mount -o sync` non-journaled filesystem. I guess it's possible that
something *tried* to log a message, but if so, it didn't get logged. 


