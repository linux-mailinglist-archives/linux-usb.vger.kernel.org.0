Return-Path: <linux-usb+bounces-33410-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAtwISyWlGneFgIAu9opvQ
	(envelope-from <linux-usb+bounces-33410-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 17:24:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D55BD14E1F4
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 17:24:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC0743041A58
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 16:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310C036E499;
	Tue, 17 Feb 2026 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bUTDSH5X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E77136C58B
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 16:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345403; cv=none; b=RLYoPtChSy35wkFwCnVuypYzizhN8X6XjcoU2lA6MXlFAufXEnQkixpcUCo+9PEXAi6cLy3mz1KgGu+BXheiqX4Dyt36RaHfGJVPf+afhy4OBeYpCYe5VQ/VpCGUjwhnLuyyCQpuzzRN3I/6ExaSuFAQKrh7GDKlzGvGmFnsgTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345403; c=relaxed/simple;
	bh=1nV2tAZcP1ZPExxl2S/FPFHsP+MbXP7uep1/AK6f8Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uzB4Cp+OI7vMK8KO5GQlQnD/7T1b3ZgMrlebiwfZBJuk+OOQ8Y2k2MFHAe51MyU6ufBbaat86l1gJ298o/COR7yrhaiv1Sn1ZpdHCDvL9Q7LxmwJ2WPdljlGC4FDqumfVqYhMNKteuts6+JQpVaWwxS08Z7t6z6ULtj755scKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bUTDSH5X; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506362ac5f7so41435241cf.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 08:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771345401; x=1771950201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WYOvdLjtHwNSJK2pAr3XURo/AmhNIZbc/clHZl1HuT4=;
        b=bUTDSH5XJre0yGTWTup9of820WVAhLBW2zvaNh2444Rj8XDBNFrw6ay3wQN5ghGEfD
         0Lwq7K993Z2O5M2sViageIbWfx1AWDFcAnLAtXi5d2lo0xnxHrdsBhlfVqo9enK1WN5T
         DNCfgyIGG7fnf59h1v/tgYkNMBwWbbyx740zWebGVJyA3uvTtOjXtCZRZATplkZ40pYk
         z2Vl+d8F4OYzxmJVO4RnqIJ1EQuMIIUKPt7J7yHDbXED61oI+FAVbNknf9SSy3pfTxma
         izEQiBCSw2ZxEEahzwbdqf/diNrZNnqi0nvLm276ZPlwZb/G92ml1vaRblKtRwRroFNW
         oWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345401; x=1771950201;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYOvdLjtHwNSJK2pAr3XURo/AmhNIZbc/clHZl1HuT4=;
        b=rghf8uLS5RYf0vbt52Kb661YxeVWxtwbeuFSt8TXXXewRWagZWGZykx8+PGeSJ17lz
         +NcyxxqtVpvJsh8Ne2YFxjS0A9yVMgQ6Cm83R5PwVv2u2eks9Ls2XPIA3DKWJAnbwP3M
         EPuNgwdFfGHcakwArgB7ULxKUJLbZ3OpJ7oeinSD3mZ97hXjVAfBWh2WVAIpplDrOpFE
         9HhgrD5DwuqY+hkhu7+OcIupiV4pUGdKFrXQta3Lo3dKmG06gCvQsWEWpdwUuMO16L5c
         v4X92JDQnOMurPXcr9uhdhgk97AbhIsqonWWQ/s0aF6edIlxbpqfGfykNskazw/U41vX
         xLSA==
X-Gm-Message-State: AOJu0Yx9WKQkmc0qIaTSGmRFMDT3aRRmfBlSpfMFyLrINcNGmOdOm35d
	s0K3orMGyl0gOBZrYtJvV8BV+4DRwxMkRuXG0YM8t+EZMQ4rCHVP6WrF8OfClGyssg==
X-Gm-Gg: AZuq6aIUFWUyOleze66yu2hiMXdTSIGFgBzNigva8dXWGfCeqb7toRt1g03FYZXxGuK
	Io1qz8tUrM73LqqNIyHzB4yPIVMyFiJ1b1uhmSoDwgnwTFg1hDzaxneMVfs9umbeb+fJM/wVQtS
	XwPAQoAavmw7REbV0anThQTC56y+JQ/Qcf8a3pEPtGQ8OtqQJ5+39K0Az93xSNFDRK0SLp6AR67
	cxbHRt1/lGhHXb6HFBrs4zW5ECp9hrcGQxUNEQKjI0wp2GWdrLx13yoOhGaTLjKNqE0M0AZ/NaA
	jjf17STHyMYuJHtr09zXWKuwxkQjaCdfnBpZmVKd0umZrekaR53myHlFqz2jaxwwQVAKTmKCi2P
	SmeP1Ks6lXMe/up/yLKiFLzzzP3zvYYrBZmCkZuizZJofDa8p65GU4YosHpW1PwGsWjCPyXGzXh
	sv4a+Gy2+/uIBGgtximEuWzGNE
X-Received: by 2002:ac8:5d94:0:b0:502:e1ed:c352 with SMTP id d75a77b69052e-506b4000553mr156721661cf.45.1771345401199;
        Tue, 17 Feb 2026 08:23:21 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cdb5dcasm180828606d6.43.2026.02.17.08.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 08:23:20 -0800 (PST)
Date: Tue, 17 Feb 2026 11:23:17 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH v2 2/3] USB: usbtmc: Use usb_bulk_msg_killable() with
 user-specified timeouts
Message-ID: <dfdc6af7-10b3-419d-a86e-8786085cfdd1@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32a96517-104c-423a-b1b1-8dd139192900@rowland.harvard.edu>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33410-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,harvard.edu:email]
X-Rspamd-Queue-Id: D55BD14E1F4
X-Rspamd-Action: no action

The usbtmc driver accepts timeout values specified by the user in an
ioctl command, and uses these timeouts for some usb_bulk_msg() calls.
Since the user can specify arbitrarily long timeouts and
usb_bulk_msg() uses unkillable waits, call usb_bulk_msg_killable()
instead to avoid the possibility of the user hanging a kernel thread
indefinitely.

Reported-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/8e1c7ac5-e076-44b0-84b8-1b34b20f0ae1@suse.com/T/#t
Tested-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 048c6d88a021 ("usb: usbtmc: Add ioctls to set/get usb timeout")
CC: stable@vger.kernel.org

---

 drivers/usb/class/usbtmc.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: usb-devel/drivers/usb/class/usbtmc.c
===================================================================
--- usb-devel.orig/drivers/usb/class/usbtmc.c
+++ usb-devel/drivers/usb/class/usbtmc.c
@@ -727,7 +727,7 @@ static int usbtmc488_ioctl_trigger(struc
 	buffer[1] = data->bTag;
 	buffer[2] = ~data->bTag;
 
-	retval = usb_bulk_msg(data->usb_dev,
+	retval = usb_bulk_msg_killable(data->usb_dev,
 			      usb_sndbulkpipe(data->usb_dev,
 					      data->bulk_out),
 			      buffer, USBTMC_HEADER_SIZE,
@@ -1347,7 +1347,7 @@ static int send_request_dev_dep_msg_in(s
 	buffer[11] = 0; /* Reserved */
 
 	/* Send bulk URB */
-	retval = usb_bulk_msg(data->usb_dev,
+	retval = usb_bulk_msg_killable(data->usb_dev,
 			      usb_sndbulkpipe(data->usb_dev,
 					      data->bulk_out),
 			      buffer, USBTMC_HEADER_SIZE,
@@ -1419,7 +1419,7 @@ static ssize_t usbtmc_read(struct file *
 	actual = 0;
 
 	/* Send bulk URB */
-	retval = usb_bulk_msg(data->usb_dev,
+	retval = usb_bulk_msg_killable(data->usb_dev,
 			      usb_rcvbulkpipe(data->usb_dev,
 					      data->bulk_in),
 			      buffer, bufsize, &actual,

