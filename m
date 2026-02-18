Return-Path: <linux-usb+bounces-33426-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHtYK7ItlWmkMgIAu9opvQ
	(envelope-from <linux-usb+bounces-33426-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 04:10:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6AA152CCE
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 04:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B51CE3012B48
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 03:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296402DEA95;
	Wed, 18 Feb 2026 03:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="WFFHlrs3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AE0283FC5
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 03:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771384237; cv=none; b=f0SmY8uSJ7M92FVLci+65TxhAXlgSplTj6EoU29Gvkg+rOUM9C/ofu6eYZ6ikr+7Yc0U3HcUbBOJK1Ouw7dbJOlxMvezq+VOY+BkD6PmitWTmYK0dV6yKBAOcf1YCJNObJbqlLgM8STJ7Fp5LQDQM3ynpJ0mLuBzqqtfz8OkjgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771384237; c=relaxed/simple;
	bh=RhQQhWqDgJJkpzzwqLK0DKYdVaNgNJjDR+rCsmPxuqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JxwSbbO9488XKR/ZXaUzm7jybAqTsTpT+IgsU6vL7ZKeBBVj25FSMPYAfPYrxx+hXY0/Jy/FTCig83mylXqe8cGsn+6mSmTVymhCUt+sRQmCf/OSk4SwwZWTIrVnOqrEjZbDIDY07RRPpzh/Gozy2+hCQHn0ehp2DLYhmL96Kfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=WFFHlrs3; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506aa68065eso42504551cf.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 19:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771384235; x=1771989035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rigc4KOdIoexWcvFl3nhOcvgbIfnL6M5v9IBZnqXrCo=;
        b=WFFHlrs3MnhTcCL2X4EnelMwSd/tZOoVa++gOgQthKQKeY2FUsV21VAtzxi8OA16z7
         UjmHgCkoNQzs7hPxNJ5262LeUwE1sPquEHSngdxd6TsOYdkeK6c8y0AOj8UFHenjnDqW
         zVLod4vB5ov0hOysNl/qzc75UCgWELN6Xv81WiHqvBH6WB42bxAL7oIFfNthSaHaF/d7
         cuSVx4DsCEdfBkGiHOiC9jrRZptL09BjI3SOJEx8aBy5JxqP8Zc2rK9eDTFgn1wUjPSC
         Gz7LjTDYX+FQcbyHy64JPrPXrajnb/nHmHFXgEVqYwxLYmHKYdyVmdy81sJQhkzDjEDR
         hnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771384235; x=1771989035;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rigc4KOdIoexWcvFl3nhOcvgbIfnL6M5v9IBZnqXrCo=;
        b=sd2j07rIT9BH1FDEEmplNPr5bgbMiFKNMN/HtnrPQbZeqA3B+FhLvkHEznAcnHavxs
         VXx3+04/+a0gW3fd3wertV9oCPQ0Uyi1wDNIIK3PTkpdOvmW4euScHAhbWkx0lfPtz87
         VioTbyycmV1c5Yi5rK2RsAs8YxMQAtfO9Zo6DpZiTa0Rtk6yh+fvlb7T1qtUZMe1zpVl
         dl+fH1Tef9kTmJF6AbZhYptH5ACWN8UQHypNo5nukF9ZYfibrZ86UlDeC15VXEaGDGN4
         eqbDvGVIlY/FaliwoRnrOtmdleqmRzif3ggyyKCIVMuTHHIuH8pBkEBeqER0DjFmXqc4
         xtUA==
X-Gm-Message-State: AOJu0Yx1psGkhJD8ZK5QkiFqud2yNivq6i1N/+omB1I0iRi4IkoyKMJd
	pBUh2YVhiQl381ljcZc2du6pC7fpofEDd7mtijyKOM0LcBrH2Tz3KOlAUBJ0iQW0bPZD336DAS1
	7wGY=
X-Gm-Gg: AZuq6aI4cUbygg2vfnSsMgvJLMY1qJ5y3HPgoDVhPCWs4yFu20m6+LRJbEZ0ZxKcuWr
	G4E9BPNw8WIrQ3/GjHKtc0//RLkyGEEz+usoxu12dUR39a/bPB1tOgiD+m4ttg8ZQc+wRoeOc4a
	nX/iRJYKhTNsS/msepz0afU/1fibuQ/x6PmC3l3d5TVc5J9CgjkyP86PyI1OiKC4MdfLKJx0hrV
	1+Npp+RBKLx8zAiA1p/qBzAxmsZsCxwPjSQxhDZ+Z7nVWmDC0KU+dBsaespbd6CmcKV5yS77HGM
	pXj3/WSKAvggsv4ZbqLTwSdhKNxMdXGQfIqYMiDguFZBuu+lkWzqlIiViAc7buRWPqNA7LkOSkY
	Kh+0YMhdFwc7+iThWaFoKPeJ+QtweDw5yF+iNR+UjNK/OH2N7ML2U8gBvsswwBZ/ES6LaJXlAcF
	f/M2IhxE7uG1wfBt8N0akurWB6
X-Received: by 2002:ac8:5a02:0:b0:4ff:c274:3eee with SMTP id d75a77b69052e-506e915218bmr7534311cf.8.1771384235053;
        Tue, 17 Feb 2026 19:10:35 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1f5669sm1703431085a.34.2026.02.17.19.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 19:10:34 -0800 (PST)
Date: Tue, 17 Feb 2026 22:10:32 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH v3 3/3] USB: core: Limit the length of unkillable synchronous
 timeouts
Message-ID: <15fc9773-a007-47b0-a703-df89a8cf83dd@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81c6fc24-0607-40f1-8c20-5270dab2fad5@rowland.harvard.edu>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33426-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 4E6AA152CCE
X-Rspamd-Action: no action

The usb_control_msg(), usb_bulk_msg(), and usb_interrupt_msg() APIs in
usbcore allow unlimited timeout durations.  And since they use
uninterruptible waits, this leaves open the possibility of hanging a
task for an indefinitely long time, with no way to kill it short of
unplugging the target device.

To prevent this sort of problem, enforce a maximum limit on the length
of these unkillable timeouts.  The limit chosen here, somewhat
arbitrarily, is 60 seconds.  On many systems (although not all) this
is short enough to avoid triggering the kernel's hung-task detector.

In addition, clear up the ambiguity of negative timeout values by
treating them the same as 0, i.e., using the maximum allowed timeout.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Link: https://lore.kernel.org/linux-usb/3acfe838-6334-4f6d-be7c-4bb01704b33d@rowland.harvard.edu/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
CC: stable@vger.kernel.org

---

v1:	Fail calls where the timeout value exceeds the maximum.

v2:	Accept calls where the timeout value is too high, but reduce it
	to the maximum.

v3:	Add the revision log that was left out of v2.

 drivers/usb/core/message.c |   27 +++++++++++++--------------
 include/linux/usb.h        |    3 +++
 2 files changed, 16 insertions(+), 14 deletions(-)

Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -45,6 +45,8 @@ static void usb_api_blocking_completion(
  * Starts urb and waits for completion or timeout.
  * Whether or not the wait is killable depends on the flag passed in.
  * For example, compare usb_bulk_msg() and usb_bulk_msg_killable().
+ *
+ * For non-killable waits, we enforce a maximum limit on the timeout value.
  */
 static int usb_start_wait_urb(struct urb *urb, int timeout, int *actual_length,
 		bool killable)
@@ -61,7 +63,9 @@ static int usb_start_wait_urb(struct urb
 	if (unlikely(retval))
 		goto out;
 
-	expire = timeout ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT;
+	if (!killable && (timeout <= 0 || timeout > USB_MAX_SYNCHRONOUS_TIMEOUT))
+		timeout = USB_MAX_SYNCHRONOUS_TIMEOUT;
+	expire = (timeout > 0) ? msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT;
 	if (killable)
 		rc = wait_for_completion_killable_timeout(&ctx.done, expire);
 	else
@@ -127,8 +131,7 @@ static int usb_internal_control_msg(stru
  * @index: USB message index value
  * @data: pointer to the data to send
  * @size: length in bytes of the data to send
- * @timeout: time in msecs to wait for the message to complete before timing
- *	out (if 0 the wait is forever)
+ * @timeout: time in msecs to wait for the message to complete before timing out
  *
  * Context: task context, might sleep.
  *
@@ -183,8 +186,7 @@ EXPORT_SYMBOL_GPL(usb_control_msg);
  * @index: USB message index value
  * @driver_data: pointer to the data to send
  * @size: length in bytes of the data to send
- * @timeout: time in msecs to wait for the message to complete before timing
- *	out (if 0 the wait is forever)
+ * @timeout: time in msecs to wait for the message to complete before timing out
  * @memflags: the flags for memory allocation for buffers
  *
  * Context: !in_interrupt ()
@@ -242,8 +244,7 @@ EXPORT_SYMBOL_GPL(usb_control_msg_send);
  * @index: USB message index value
  * @driver_data: pointer to the data to be filled in by the message
  * @size: length in bytes of the data to be received
- * @timeout: time in msecs to wait for the message to complete before timing
- *	out (if 0 the wait is forever)
+ * @timeout: time in msecs to wait for the message to complete before timing out
  * @memflags: the flags for memory allocation for buffers
  *
  * Context: !in_interrupt ()
@@ -314,8 +315,7 @@ EXPORT_SYMBOL_GPL(usb_control_msg_recv);
  * @len: length in bytes of the data to send
  * @actual_length: pointer to a location to put the actual length transferred
  *	in bytes
- * @timeout: time in msecs to wait for the message to complete before
- *	timing out (if 0 the wait is forever)
+ * @timeout: time in msecs to wait for the message to complete before timing out
  *
  * Context: task context, might sleep.
  *
@@ -347,8 +347,7 @@ EXPORT_SYMBOL_GPL(usb_interrupt_msg);
  * @len: length in bytes of the data to send
  * @actual_length: pointer to a location to put the actual length transferred
  *	in bytes
- * @timeout: time in msecs to wait for the message to complete before
- *	timing out (if 0 the wait is forever)
+ * @timeout: time in msecs to wait for the message to complete before timing out
  *
  * Context: task context, might sleep.
  *
@@ -408,12 +407,12 @@ EXPORT_SYMBOL_GPL(usb_bulk_msg);
  * @actual_length: pointer to a location to put the actual length transferred
  *	in bytes
  * @timeout: time in msecs to wait for the message to complete before
- *	timing out (if 0 the wait is forever)
+ *	timing out (if <= 0, the wait is as long as possible)
  *
  * Context: task context, might sleep.
  *
- * This function is just like usb_blk_msg() except that it waits in a
- * killable state.
+ * This function is just like usb_blk_msg(), except that it waits in a
+ * killable state and there is no limit on the timeout length.
  *
  * Return:
  * If successful, 0. Otherwise a negative error number. The number of actual
Index: usb-devel/include/linux/usb.h
===================================================================
--- usb-devel.orig/include/linux/usb.h
+++ usb-devel/include/linux/usb.h
@@ -1863,6 +1863,9 @@ void usb_free_noncoherent(struct usb_dev
  *                         SYNCHRONOUS CALL SUPPORT                  *
  *-------------------------------------------------------------------*/
 
+/* Maximum value allowed for timeout in synchronous routines below */
+#define USB_MAX_SYNCHRONOUS_TIMEOUT		60000	/* ms */
+
 extern int usb_control_msg(struct usb_device *dev, unsigned int pipe,
 	__u8 request, __u8 requesttype, __u16 value, __u16 index,
 	void *data, __u16 size, int timeout);

