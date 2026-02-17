Return-Path: <linux-usb+bounces-33411-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIl1DiaWlGneFgIAu9opvQ
	(envelope-from <linux-usb+bounces-33411-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 17:24:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC3A14E1E5
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 17:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 120B6303E75B
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 16:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1525636E49D;
	Tue, 17 Feb 2026 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EXN19ztB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8E336EA9E
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 16:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345421; cv=none; b=euXBpVmkyeMnFo3U1lIzxKiT2virWUwCPpth9UU5Cubm0bHKFhfGyWghitjgZVqK4sNda6sB09QUtY1X5RNBg0d4o+dAbWVdDrBgnf0ETbw5jZtJgiM73tsnTJjO8W2vJcqXjeVYr3p4HBEry9G2aQ7NzbCzZcPRkimZwbnm30M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345421; c=relaxed/simple;
	bh=eZ7hwC6A7TJip+Ae5XhqjA6saGWBMLUHTq3aYVETykc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=a76pDcC0hEd4JAg2t+L8zRh3qO3mNmTYiJ3rowslXvivvZ9vI4vNHyLLNZwEsxeoF29lo1sA0c3Osnj/mt/7JlzHRIhsBZHWN4E80/ywevSO0oCrTse313fucQLIvi79xhzPCaB1guQm9yT2+IOpfYs+CmClUPETtgBUvA+pjgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EXN19ztB; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-506a297c14bso43219061cf.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 08:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771345417; x=1771950217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QPQzfJ3nThIV1zhMGjyKuSsUiOoaf2Y+SYWsYlt96dw=;
        b=EXN19ztB2I0XHsjDWomxEfdqZ6uakM6yi047JMQ8zd/qRtWKS+VhQBYNnr0JSNguui
         fceeGpeGVDU3rFEO1EOoJ8Tv1n+aAHVZ481RLLHZOJiOWX4PllzN+OKKaiFJHZW9mfyk
         LQLp6B/VuaCJpaPomRuUpwpR+jGAuBO8cgWJgi1k+elEX+nAzldhexfJqA1sOE2/wgLA
         dwrQLXi5qkScbVDh2NjWWW/KNDsToKXYuNXSOnweyN3uXkLyy4yxrCLJ2bQkhq4gsjc/
         5l/MyiONOKcp+dUGBwjEdE+iPVcX4V3ULqCLaYfPyfuSxbaDXfOHj+xKUvWVJWwlTtwr
         AUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345417; x=1771950217;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPQzfJ3nThIV1zhMGjyKuSsUiOoaf2Y+SYWsYlt96dw=;
        b=ZfDDZq9vI8ltw/a534Ijmw9uwwamIxiMPyAvL32E2XBaLWiHXBHeKwhroyuxIBVtta
         RDyvTNcshaeJqOBM562paoX4RC9vT0qrqoQVD26WTcQvQMx+RK4oltDaXbiB1elihfLT
         zZHx35PNNK+gh1ng5joy6+oQyuGeZ5MP1pjwTBy2blo0aza4ZvhwD7s8EvEXoqXs90qA
         zkqFkIfjYYIDFcoD0gJIj2kkBXcUtM4OpfG4TMekUMOmgup/4AYauc6PondbFj8eCWUS
         EWTdUDW6HJ/DFLSHtW8bPuGjy4bVevPpIIuX4BLUWak7SKplXZnhKiiJboRcSKs7Jv9u
         GYBQ==
X-Gm-Message-State: AOJu0YxbboDeusWnS19AxHqylGp9Zj9BQTXAOy7YPDNdMRFl28E48ieX
	l+2QyRYm4H3wVe+8JKk6adIEbKYzVtCz6RE73Ja1LXIgMJ2AzgZb8FOAMT/LX7YcJP6lV40tS7k
	5J5s=
X-Gm-Gg: AZuq6aJiKr9Z7hMcxmMVcwOQo2Isr5Z94VBnBQ2WNCwekzcgeXYvuZZQnRyQCiOxZ6v
	Z2ClgmsB4yhL370OSbonPdByzUqA3xtnK7u6EVjKot+UL9DZKpDP83c8LrgCm+3mqLNIlhtlws6
	ZLUKVv6niUkGXfuFixwqAjKiFbqfZt2TOHYWv5AtOxoawXKTQkJB4FujkqJQ6xEefEoWHTl7zCB
	d5aJAjJTk/MtrzmAJbl0YEB+ULdcsdymHpS0gAj65Eqb2DZTU0H38AMO8x8Xm3tdtdneNTGvvaO
	m5jUd3KwDCqfJOcO0BSPzjWq8Fulc5RmmLEOwQ7XXonJx3kfTC0Kpv2KU0WcHOAhb+VK0x1vNv1
	g4aavmHJ55rQ2M1dtM9DKQG06mS3b+dtL8f6jeofF+5SYns3aM7qQ2xxFr80aGKeqFeTq4ujCmJ
	mgXWyOkSWBZFrknnhstU8jSjvF
X-Received: by 2002:ac8:7d94:0:b0:506:20bf:44a0 with SMTP id d75a77b69052e-506a836330emr179220271cf.65.1771345417353;
        Tue, 17 Feb 2026 08:23:37 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::94e8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506b275d59fsm98525531cf.32.2026.02.17.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 08:23:36 -0800 (PST)
Date: Tue, 17 Feb 2026 11:23:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH v2 3/3] USB: core: Limit the length of unkillable synchronous
 timeouts
Message-ID: <6c247bed-da55-4cb1-a4fd-1277aeffdf02@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfdc6af7-10b3-419d-a86e-8786085cfdd1@rowland.harvard.edu>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33411-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,harvard.edu:email]
X-Rspamd-Queue-Id: CAC3A14E1E5
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

