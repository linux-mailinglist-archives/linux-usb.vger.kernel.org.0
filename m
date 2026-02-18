Return-Path: <linux-usb+bounces-33425-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KZINmstlWmkMgIAu9opvQ
	(envelope-from <linux-usb+bounces-33425-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 04:09:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9A152CC6
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 04:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B711B30175E0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B253286890;
	Wed, 18 Feb 2026 03:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ImR2qDu1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990E7283FC5
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 03:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771384167; cv=none; b=KoEUcij8By8NBDfeBC46QEncGq5McsQJAs+rhf4OXZhXlN67SqE52k4JwFJb0sPhPR3NIY1VqGT5/iq/l66+dVH6gM3XS+S27pkROKa92bRGRrLO37vqLZhWEl/uaSWoSFlGuNnZoM8n79i4aWhrKfSxflBOGyLl5dJzKjAqXzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771384167; c=relaxed/simple;
	bh=ob4KexTr8ElIW0TvcsKfGdTRnrj4iH14KxgUy3acjug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BtT4lXphSryfFxXUVIM05w9OCw0R35VVdcvGCEiqzcK3VeAqZNIjrcnUrT0sq4tIMk2E15naQbzVweaCuLpN5pbx3zPyhhSHeYBl+56byOYcgbH/T0eafkDcRuOXMRqPDWgtDHDqMUfjINIPc81V5Bda3MOVVSvuQ5TSjzXRWZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ImR2qDu1; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5069b3e0c66so5032351cf.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 19:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771384164; x=1771988964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/XM1KJMjLwWEdWq7o05rdjo0zEc5+ytR+zPaUFqwI70=;
        b=ImR2qDu1XSGb76Uq15TJwHSlWsTCnMQpe46+f3suGFufzW/8X1gj90wcfTl5/e6y3l
         aw4/gSb7qLbEGVEa+nRMkmBv5XJugRJrGViI5HjFSBZRQkngbwj1eRic0x8OTeOcdInR
         SgmKoB4zR9GDl1X8ammFvZnDhMeHtdY4AtpSYihonRpll5LCvbuUtYol9u/Tq8CRPTR/
         BBW1WiuYeYXRAf8Ex4FUQyU2EqDx2vGswvAel4GFyu6HijRetQXrO67ona1vuCR6Yz1Y
         ck2isB9gNu9KKDjrHEUKWl//TXchSUZ77E/i68IHOAeDZeuueacHKp5jVAdDZ/F1mgXd
         cJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771384164; x=1771988964;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XM1KJMjLwWEdWq7o05rdjo0zEc5+ytR+zPaUFqwI70=;
        b=Bs1AFtqpCyBwSfrZUvKeatygTHaDuTqOyZAdQc9S8Dbdikn4kfKMjkRImiQMQux7K+
         eEjAEkbrC8VD6fHdkOus3InCDlMgnuhmIaTc8rONmP5Rj8++aPgdjXP/kPQUARP1GAhM
         vr97zqN+wuUiG9u5Z9MVQUUnMpcp41rK6xmDG7WuIxQN6sUGKWUAGC/PyDKMldZkjeYF
         4XTqNkBdE26AOdK77qLZFwvUe9+G+xCCNhehNU/snpDgq8bsqaGkBjl5BHPDtdr2tYh8
         aB1mhfefy317dnIluoZ6XYUeaDrWzXZk8VnO+yZnHpwfNVqEQ3EsqJeELe0M6XA+LUAN
         M5Ow==
X-Gm-Message-State: AOJu0YzXMhFOt0hG4Ep1Uda7JHEQqoQtj5nzlRElyPEUzs9nrpR6ulNf
	aY08AqzNV8iBqlfySqYDJ5LV/trZglYbcCg0Mj/gzWTx95UfXu3+G83fJU6cjfZdRWBu2LcvTnM
	GFv8=
X-Gm-Gg: AZuq6aIKFebK4MG7BbQZwhzLYmqQIXwqPTRKntjjWwYas+NAC/XeC1PntyyvlvcohVd
	K9/gL+RzVTfVXC3JcjYH65OtJ8qGt3kwJfgaSkj77dXZ+DJbxcSCVzS2c5GE4u4PJf7HcRD29gB
	WIqiF+kyEvKHpXqHMynfqaHI2TRu3eIeqwB/N/y30SeZzN8R4cCvZpZMuJ6sU59phnLVQajlxBh
	pXZPnfxtwmlxtMTOwijsse1LuRPOWPiM/9KM18oLTLyW19gAcCWv3kGdfDvs0BzZtNnRwJ7x6mX
	Zu79i5n7H2X3KQfr6ItsV3eruVEpZiDEuu2b1A70HDBv3OzYYegiNgJFvFJKzwHwVXFUgj8uwrA
	9vXK798C37rqCNyMPRY73Lqw72W2DmRtOcVkKmYv9OEfKn60MAMZbaTigBinTC2lX4SvovNhH+7
	CcU8hqu3ixEt9xniboPYH/e5SK
X-Received: by 2002:a05:622a:1a9c:b0:4ff:b0e0:7b66 with SMTP id d75a77b69052e-506e91c06acmr7083301cf.21.1771384164592;
        Tue, 17 Feb 2026 19:09:24 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506847d6f55sm195536501cf.5.2026.02.17.19.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 19:09:24 -0800 (PST)
Date: Tue, 17 Feb 2026 22:09:22 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH v3 2/3] USB: usbtmc: Use usb_bulk_msg_killable() with
 user-specified timeouts
Message-ID: <81c6fc24-0607-40f1-8c20-5270dab2fad5@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <248628b4-cc83-4e81-a620-3ce4e0376d41@rowland.harvard.edu>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33425-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,harvard.edu:email]
X-Rspamd-Queue-Id: 84D9A152CC6
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

v1:	Reject ioctls trying to set the timeout to a value larger than
	the maximum.

v2:	Don't reject overly large timeout values.  Instead call
	usb_bulk_msg_killable() rather than usb_bulk_msg().

v3:	Add the revision log that was left out of v2.

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

