Return-Path: <linux-usb+bounces-4137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF7811EAB
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 20:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CE24B212EC
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 19:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799E867B69;
	Wed, 13 Dec 2023 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmadams.net header.i=@cmadams.net header.b="GDS++4Jx"
X-Original-To: linux-usb@vger.kernel.org
X-Greylist: delayed 60 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Dec 2023 11:17:55 PST
Received: from linode.cmadams.net (linode.cmadams.net [209.123.162.222])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4AFB0
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 11:17:54 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by linode.cmadams.net (Postfix) with ESMTP id 4Sr4wf3bSBz6wCG
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 13:16:50 -0600 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cmadams.net; h=
	user-agent:content-disposition:content-type:content-type
	:mime-version:message-id:subject:subject:from:from:date:date
	:received:received; s=20220404; t=1702495010; x=1703359011; bh=Y
	M9JpeT3Ug6i+TGB3I8ifLt0zq10vEKh5Qiwghx5deU=; b=GDS++4Jx/qRMbSZLP
	Vpi3Cw9gcRL3nmYeH83oTXYZcDghU2lGUnDRZC3pzSbpL0rYFN6O1/6WPWIcQGGC
	ycoyXGBk1o0HZPqHkwRSf/ss2fUQn+medqO3T3BHYAs85bY4+i85Cz2TogIE/vNR
	9WpqXwEB8MA1aeAO0LEclVnfUpcDRxAENqAuYkd5Eu4KSkc+2mN6A5ON/3LETlV7
	BqRfBPISGoXSskZZeCYOEuRaPGJZOCvIp1JH4H+kYeS1jjI4OmrJXGu/PHmLsj0v
	jkFpuKCegGvUoBq8XBXnrSMBo4pqrhxLPpTp22998GAELWA7hsvuB2vdLhXAXBUh
	54ALQ==
X-Virus-Scanned: amavisd-new at cmadams.net
Received: from linode.cmadams.net ([127.0.0.1])
	by localhost (linode.cmadams.net [127.0.0.1]) (amavisd-new, port 10031)
	with ESMTP id jEuQQE47XJs2 for <linux-usb@vger.kernel.org>;
	Wed, 13 Dec 2023 13:16:50 -0600 (CST)
Received: from cmadams.net (localhost [127.0.0.1])
	by linode.cmadams.net (Postfix) with ESMTP id 4Sr4wd6fx0z6tRq
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 13:16:49 -0600 (CST)
Date: Wed, 13 Dec 2023 13:16:49 -0600
From: Chris Adams <linux@cmadams.net>
To: linux-usb@vger.kernel.org
Subject: See USB-C charger info?
Message-ID: <20231213191649.GA28331@cmadams.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)

I accidentally plugged my notebook into a 15W phone charger instead of
the 65W computer charger... but got no notice under Linux about it.  I
happened to reboot for updates and got a message from the BIOS about it
(this is a Thinkpad T14s AMD gen 4).  So I started looking to see if
there's a way to tell that from within Linux, but I couldn't find
anything.

Am I missing a way to tell?  Would this even fall under the USB stack
(if not, any suggestions for where might I ask)?  I know USB-C is a
"complicated" port.

-- 
Chris Adams <linux@cmadams.net>

