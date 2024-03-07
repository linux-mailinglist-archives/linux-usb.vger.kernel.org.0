Return-Path: <linux-usb+bounces-7674-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 016FC875306
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 16:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A38EF1F24ACB
	for <lists+linux-usb@lfdr.de>; Thu,  7 Mar 2024 15:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9877212F37F;
	Thu,  7 Mar 2024 15:22:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE0312EBF5
	for <linux-usb@vger.kernel.org>; Thu,  7 Mar 2024 15:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709824947; cv=none; b=iO3QjcFBugGazGBAcvxocGYeKayNwpnMS4zRJ5ijgmJGnWFV5x9loBZKny3U1Z2k1OprzXR6DNec/hnTXErNVYW5oUyC05vDX9xJYU6xx2sWnT/k6tuJBusgEwOLxqeL0DtUd2iTKtITPaW00MZJgJzkRY+e4WRQIf9ehN+T8xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709824947; c=relaxed/simple;
	bh=al/3O5BMtVX77mnBsjoWd7iFAkemoIICSbzlxCwd/N4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m75wLfk7BvVr5lenIbHmmidwM3bpEc+GZ7bKfeavNA2bY0cR7+PW3JkOaK+V7H99O5dvfUTzrMh1QXAfGbrGD0M14wkiakA+ofjSk3ad0SflnhvwgpKZH6Hj6zXGaK7b2WAwxfbgejCPFbGi3ncCYhaluhKHiHQxcMAFko++gFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1riFZd-0007MK-5U; Thu, 07 Mar 2024 16:22:21 +0100
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1riFZb-004y6g-Pk; Thu, 07 Mar 2024 16:22:19 +0100
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1riFZb-0029BI-2Q;
	Thu, 07 Mar 2024 16:22:19 +0100
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: [PATCH 0/3] usb: dwc3: gadget: improve abbort transfer abort by
 adding more conditions
Date: Thu, 07 Mar 2024 16:22:02 +0100
Message-Id: <20240307-dwc3-gadget-complete-irq-v1-0-4fe9ac0ba2b7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvb6WUC/x2NwQqDMBBEf0X23IXECJb+SulhTTYxkEa70bYg/
 nuXHt8wb+aAxpK5wa07QPidW16qgr104GeqiTEHZehNPxhnRgwf7zBRSLyhX55r4U078kJL1xj
 JDWMMFlSfqDFOQtXPOlD3UjRchWP+/v/uj/P8AQgv3fF/AAAA
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1021;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=al/3O5BMtVX77mnBsjoWd7iFAkemoIICSbzlxCwd/N4=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBl6dulQmUw551hBNuosA6A/RS41603zYpf+CrkC
 hCQ2XoPZyiJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZenbpQAKCRC/aVhE+XH0
 q+WFD/9tCX2OfjC4b5poKn1iBn0HRR6VGSch432b2rUGoI+JCcmdJAtCwnzvFDCNU2eqzYoBgNi
 KYaUIwCitWUu23bT9EtD3y0QrRNpBPXsvgL4OwV4dGg59Yp3Gf/IN77pkd2TrGYN4zzqpxL/6ZU
 F2BCUa0dhWUMdc124q3MfnJwzR34E08jSf9chuADya/DHQVsYRwJMSDB/Zc1GDVZlIaC3/3JbHh
 3gAZd+tO0A57FCIUvGzDyEbp8EpbWb5DsVsaDGccfR1b75WFWMB9YXMqAYlG3xp87K/xvsEWIGP
 ebAA4MMbEmQn+lMA7JpAHYn1/Ni/d9TTRKh7jp7EfLN1icVY1beX4icVph7eDNt7n6MQ/N4txBn
 PRFnjbZ9YtyK1tqAZmjUwVZS7hS39mMJhekHiOx70RoXCBcb6GJc04l67IfnITbl3tjn8Nxub9O
 jMaDZSrTDHlxL+yA2OBnFY3rvGUgHJA89B+KOzWtnBPdsnarMR/65WWrV7WhLVBZARiKzIw3GSi
 rB7hNRdN8Wi+eqE+53fqK8UEdXR/OQ8KYnRiTOhxYp0p26wqpipmd2jcmjZ7pVSzH05dPAZZYVZ
 baoLaSOY4/6TTECLNue+oFejBN45+1/zoQvXxYBkPqSoZ0K/RPxZNZaK0qaD2vdynKnPTqGHz+F
 LHmh7bU5/EeVkRg==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

The dwc3 gadget driver is correctly checking the prepare and started
request lists for potential underruns and will stop the running transfer
in that case. However it is possible that the running pipeline will lead
into more underrun scenarios, which can be avoided and be detected. This
series is adding the corresponding code to ensure that an underrun
transfer will be handled properly.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
Michael Grzeschik (3):
      usb: dwc3: gadget: reclaim the whole started list when request was missed
      usb: dwc3: gadget: check drained isoc ep
      usb: dwc3: gadget: check the whole started queue for missed requests in complete

 drivers/usb/dwc3/gadget.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)
---
base-commit: dfea18989aa7beb42c2cb6344fe8787de35d9471
change-id: 20240307-dwc3-gadget-complete-irq-1a8ffa347fd1

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>


