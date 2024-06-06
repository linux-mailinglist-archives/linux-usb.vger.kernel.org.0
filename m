Return-Path: <linux-usb+bounces-10991-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E337D8FF658
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 23:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7322B1F254E2
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 21:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A956F08E;
	Thu,  6 Jun 2024 21:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=exalondelft.nl header.i=@exalondelft.nl header.b="EcCdukBi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailfilter01-out30.webhostingserver.nl (mailfilter01-out30.webhostingserver.nl [195.211.72.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C481544C68
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 21:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.211.72.101
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717707982; cv=pass; b=tHIgBAAV4MpMY4yMGLE3pPH2y/qQOH16ZxfhVdCcjz0b208Szfa3kkfyr6IE8kDiXuMfiVNYJQQRTrUdYHyIoqVbs8YBVLHEAfHdil2GN0RE6xb7VlL0SY4FBVR4E5vwFvw6jQbiKxkXr7HxvJE4XXTas9YzsbyZtQrLJ30eMoc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717707982; c=relaxed/simple;
	bh=FlPshzzsKq0FTOB4NsIwbIrKkaxyemDmfw3O1xsn+bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUSC7gSWWroyEGPcj3k61Hr8Lgiegqlp9fh+Wh6/FKKSxr9OuRaNE4rHKZajuAjxFdvIUeNlsfFnOBFp1XBi2aEC3uIxYP7np+M/BKU3gm1+LzyiLP/g3g54ulH0TPgFudse3XSrx4V5yvEKhk/jCZ9OfV9R3mx1gQCeyDKUqIU=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exalondelft.nl; spf=pass smtp.mailfrom=exalondelft.nl; dkim=pass (2048-bit key) header.d=exalondelft.nl header.i=@exalondelft.nl header.b=EcCdukBi; arc=pass smtp.client-ip=195.211.72.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=exalondelft.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exalondelft.nl
ARC-Seal: i=2; a=rsa-sha256; t=1717707909; cv=pass;
	d=webhostingserver.nl; s=whs1;
	b=gVSCgaaGLhp+BGaxPPySQqgBQnyvFZACt9ofhfHmJevSlxPqEqFIzLeWM/GAqjgYNkOfarPmLew03
	 3EQtkcEjSYqDcUUG2mjzUs5+09g4pfAbFfjsSK2hsu5FTze41Kup+pL7s62H0xjXU099aTg8c5Tlc1
	 O6mK13fIvWjmgE/5wVKfxN9XMtTTU48+loCEs7NopGwRXThzHBiV5F8nOIdhUaZhUiT0J6tOIYRm6w
	 1bLCZlZzhRTdeGypT41KZxeGMDNSbF4KTytJrOVJ/LO2iVs4bopCb5NNAqHSVB8XC87fpXb9so+JVi
	 RbFMwrPS8pNjc29QjW7rJ48H5uqNHwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
	d=webhostingserver.nl; s=whs1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 dkim-signature:from;
	bh=D7fNeAroC+9NlN3PRHXmGK1172PHj8eqUc0ato6uCEs=;
	b=ihTXQ0J3/CwSF5y3LeYbfwPvSmzQhtfAa3pLCsKO+NkD8b0bdVhmzNOvovMq8IvxgPNkkAOdLG/4y
	 h1czr2V+ifvbWjldAsMj9xC3uaarzZZVykIb6g65NdBnQSxDp3pLA5AbMXs8qoSuGE0rWUxBSCT2fI
	 +q9isA8VyAgj6EYlXbVDwUMeM6vjGSnBtF8VU9SEZgmesmGigbeJfpRSpcQoNGPpFGx4Py/B6RnM11
	 rqI56mmDvPYdMx7KkVdk9SlrkuheynFFsxk6m4uFoK6X4a5z/Yk8zoRkxamNKjn/6DUmz60s+JHur9
	 hqqH9YVzz6FSz2B8kaEJm2aLF5wjP1A==
ARC-Authentication-Results: i=2; mailfilter01.webhostingserver.nl;
	spf=pass smtp.mailfrom=exalondelft.nl smtp.remote-ip=141.138.168.154;
	dmarc=pass header.from=exalondelft.nl;
	arc=pass header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=exalondelft.nl; s=whs1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=D7fNeAroC+9NlN3PRHXmGK1172PHj8eqUc0ato6uCEs=;
	b=EcCdukBiFg5opAt+aurMW615i85lLpxdLM4cmlm56ygew2F3D1YYxIU3wH0nK4aGRIOrffcAYYOAp
	 904vsOa0iTSJZ5gHZ6WmCu20bivVleKWBUxFem8NcUED92rfDpsqh1VIGk3iu6FOSr1y872JKRkyk3
	 QaWzigYf2hzbsuHah68Dm32wqP9OlP7t3eVABav2kZcInorto/EH1ImkLTlyxCE3wW/sOZ9pahmfx/
	 Trv/HUIPqpcYnnKxhD8t18YLRlI5HZBFxFle/8gblEXFmu5gOON+GR1tyg/HZ2j8w4zur/mCkFtrn3
	 mulrXfbPwglpQxZK4ttazbsvxpSUpWw==
X-Halon-ID: 73e69e04-2448-11ef-8d21-001a4a4cb906
Received: from s198.webhostingserver.nl (s198.webhostingserver.nl [141.138.168.154])
	by mailfilter01.webhostingserver.nl (Halon) with ESMTPSA
	id 73e69e04-2448-11ef-8d21-001a4a4cb906;
	Thu, 06 Jun 2024 23:05:07 +0200 (CEST)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=webhostingserver.nl; s=whs1; t=1717707907;
	 b=als09rKqlo1LoeIPZH5A2708QsWwJUxT1ysPfhf9SWnbFGLQGYemDDjqivkZFV8hr9k8g7pQRO
	  FrrR2llScHhXf0y0bdbt0EpGadChLT1Y4DvHxtXmyK1TgUCWHMSpiJXUVGoiC7tbLtF36Ny+2b
	  Jpvwi/bbzTpphNk9FfMVKEDI+/VbQabIhxR4iMN1pW/RIiBpPQf7akdDReF7kHBSZ0YsiUwH8I
	  o7Sd4xzLK1JLKtTfYms+LKe+Ya4CLDg7mt4+9QUrLLqHiBXlWo7naEayKRXgudTKHcWtIaJwLs
	  9AZ2EXPUa6aH1DScnRUR5MyACtdZr8f4FH+jvM4Smo2YYQ==;
ARC-Authentication-Results: i=1; webhostingserver.nl; smtp.remote-ip=2a02:a466:68ed:1:d680:309e:9a32:ec62;
	iprev=pass (2a02-a466-68ed-1-d680-309e-9a32-ec62.fixed6.kpn.net) smtp.remote-ip=2a02:a466:68ed:1:d680:309e:9a32:ec62;
	auth=pass (PLAIN) smtp.auth=ferry.toth@elsinga.info;
	spf=softfail smtp.mailfrom=exalondelft.nl;
	dmarc=skipped header.from=exalondelft.nl;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=webhostingserver.nl; s=whs1; t=1717707907;
	bh=FlPshzzsKq0FTOB4NsIwbIrKkaxyemDmfw3O1xsn+bs=;
	h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	b=MVXY/U+S+te1Ej9jciCm9o/eUMoWmqcPIonDyv1tngT2H0McKI8jvol/a68234QwzV33G3YYdC
	  xyDg+ZStTSNVkub3VIFlGtFSf9sXjHRrEI5y09og896u98THaFjyZothXriakSPK9Qv7hKppvB
	  LCMTN2TkHxNsb6LxBiCvHAFzqXeMwhbI1QxQQ4mtMHHIRkljuLbSPkHJFQ19m0GUm1tcWxtG2d
	  uSM87zQtBuE4RiwjrVPZuX4r9bcHYmRcgYC+WLzZ6TRheuSEvseVy+QpiHeqUeKTYYSE/HJGk/
	  o571QpoMPqUl0BVKAhF+htwwcKejmFLHWPsvoQja1UD/Vw==;
Authentication-Results: webhostingserver.nl;
	iprev=pass (2a02-a466-68ed-1-d680-309e-9a32-ec62.fixed6.kpn.net) smtp.remote-ip=2a02:a466:68ed:1:d680:309e:9a32:ec62;
	auth=pass (PLAIN) smtp.auth=ferry.toth@elsinga.info;
	spf=softfail smtp.mailfrom=exalondelft.nl;
	dmarc=skipped header.from=exalondelft.nl;
	arc=none
Received: from 2a02-a466-68ed-1-d680-309e-9a32-ec62.fixed6.kpn.net ([2a02:a466:68ed:1:d680:309e:9a32:ec62] helo=submission)
	by s198.webhostingserver.nl with esmtpa (Exim 4.97.1)
	(envelope-from <ftoth@exalondelft.nl>)
	id 1sFKIE-0000000APHI-3z6Q;
	Thu, 06 Jun 2024 23:05:07 +0200
From: Ferry Toth <ftoth@exalondelft.nl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	Kees Cook <kees@kernel.org>,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	Justin Stitt <justinstitt@google.com>,
	Ferry Toth <ftoth@exalondelft.nl>,
	Richard Acayan <mailingradian@gmail.com>,
	Hardik Gajjar <hgajjar@de.adit-jv.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	s.hauer@pengutronix.de,
	jonathanh@nvidia.com,
	paul@crapouillou.net,
	quic_eserrao@quicinc.com,
	erosca@de.adit-jv.com,
	regressions@leemhuis.info
Subject: [PATCH v1 0/2] "usb: gadget: u_ether: revert netif_device_detach change
Date: Thu,  6 Jun 2024 23:02:30 +0200
Message-ID: <20240606210436.54100-1-ftoth@exalondelft.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ACL-Warn: Sender domain ( exalondelft.nl ) must match your domain name used in authenticated email user ( ferry.toth@elsinga.info ).
X-ACL-Warn: From-header domain ( exalondelft.nl} ) must match your domain name used in authenticated email user ( ferry.toth@elsinga.info )
X-Antivirus-Scanner: Clean mail though you should still use an Antivirus

As agreed with the author, the netif_device_detach change is going to be reverted by
this series, so we will collaborate on a new one in the future that
brings no regressions.

Ferry Toth (2):
  Revert "usb: gadget: u_ether: Re-attach netif device to mirror
    detachment"
  Revert "usb: gadget: u_ether: Replace netif_stop_queue with
    netif_device_detach"

 drivers/usb/gadget/function/u_ether.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
2.43.0


