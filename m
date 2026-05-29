Return-Path: <linux-usb+bounces-38161-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIWAAfuWGWrVxggAu9opvQ
	(envelope-from <linux-usb+bounces-38161-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 15:39:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D29A602F37
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 15:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A4D130860B7
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 13:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1610733ADA4;
	Fri, 29 May 2026 13:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ScKluDid"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03481A317D;
	Fri, 29 May 2026 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780061443; cv=none; b=T1V6kLjXj0VYsCpKlLUqgFoaKLSf5NxThQaYlsxwoAaIodtfJ/lW6t/T7f1u6Y5/OjYxpM6XnPMElio2K9htBdZCbLnMWsaOLtpUOxFoZbBhzuI5cW163mWoSPBTTrPABDqxB/+8QUplXlCLrfcmKFrArOQQMAuxxXt9sr7f8Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780061443; c=relaxed/simple;
	bh=l4FtlYAFVGGwJ01QQvvbOOFq6kUcwolrPH7wRgellI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Igk+vZdjzzMR4hQTmC7vghdd7L4fwM/qiYfUVM4abJEML+jOC1OCnlIa94hRMagvcqAJhUn2Rqa5UWUu4exrVPFe0DudqDlwe/QSJi2i3QgPTYHlnRN5H2IZX5QMvH3+Aqc5reHMpIrhCFCkVhr3uVpf2jBw3T75nK+a9CaSlt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ScKluDid; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=73WSiQahK0e7pTM/jXl4tkpRquFkFACnnUUVn2QgnN8=; b=ScKluDidZLxT1Y0WVeZ3MEhYsl
	QBbjoRh5C6lH8vSUG+3oPOT5HMGm83GBvZU/gvmSEJXvTHGq042l5O2+lwOWjrqye4ECLXKmUqMVC
	FnEnj8aAcqiSZT52nF1VMk1y9D3NIYu3q5XmBDYvcx6Omf87FsRsHhEozeGQEdBPDxIxVBqlwRgUq
	iERRJsP97v/Fzx4s5r2sXj2hvULOxcP8vPoIiDCZv0jKfqBNrsnwphKls6s+1PPPXJD16CBIw/0jd
	0QZVcfe55Wbg1YRBBhCXSRALRdK2sM05MDK0YJltqjJlrEFCBpapoE9wQ0rjeJOH+el3+b7gnyeFw
	cF+ZiIzg==;
Received: from 177-136-90-227.vmaxnet.com.br ([177.136.90.227] helo=[192.168.1.54])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wSxIF-009sTG-6d; Fri, 29 May 2026 15:30:31 +0200
From: Heitor Alves de Siqueira <halves@igalia.com>
Date: Fri, 29 May 2026 10:27:35 -0300
Subject: [PATCH] usbip: Fix use-after-free in event_handler workqueue
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-b4-usbip_eh-v1-1-582e931cc7e4@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrDWp+om6iohoTRkLpINIxN0Vy
 2/x3gWMnpChii7weBDTMgckcQR27OYBBfXBoKQqZK60MJnY2dDa4ii0U4lOtS1N3kEoVo+Ozu9
 WN795NxPa7V3AfT/Nl+Z0bwAAAA==
X-Change-ID: 20260529-b4-usbip_eh-9f21939c8b5a
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nobuo Iwata <nobuo.iwata@fujixerox.co.jp>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.org, 
 syzbot+62c1aa73226b3ac3b107@syzkaller.appspotmail.com, stable@kernel.org
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38161-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,zenithal.me,linuxfoundation.org,fujixerox.co.jp];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.846];
	FROM_NEQ_ENVFROM(0.00)[halves@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,62c1aa73226b3ac3b107];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,appspotmail.com:email,syzkaller.appspot.com:url,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 8D29A602F37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In vhci_stop(), the driver calls usbip_stop_eh() and waits until event
flags are cleared before proceeding with cleanup. The event_handler thread
clears event flags before calling wake_up(&ud->eh_waitq), opening a race
window where wait_event_interruptible() can return before the event_handler
thread finishes. This causes the teardown path to free usbip structures,
leading to a use-after-free when accessing ud->eh_waitq.

Fix by flushing usbip_work in usbip_stop_eh(). This ensures the work item
has finished before the driver cleans up the usbip_device struct.

Fixes: bb7871ad99ea ("usbip: event handler as one thread")
Reported-by: syzbot+62c1aa73226b3ac3b107@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=62c1aa73226b3ac3b107
Cc: stable@kernel.org
Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
---
 drivers/usb/usbip/usbip_event.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
index 0e00c2d000f8..2d041b7ee7cf 100644
--- a/drivers/usb/usbip/usbip_event.c
+++ b/drivers/usb/usbip/usbip_event.c
@@ -97,6 +97,11 @@ static void event_handler(struct work_struct *work)
 	}
 }
 
+#define WORK_QUEUE_NAME "usbip_event"
+
+static struct workqueue_struct *usbip_queue;
+static DECLARE_WORK(usbip_work, event_handler);
+
 int usbip_start_eh(struct usbip_device *ud)
 {
 	init_waitqueue_head(&ud->eh_waitq);
@@ -116,15 +121,12 @@ void usbip_stop_eh(struct usbip_device *ud)
 		usbip_dbg_eh("usbip_eh waiting completion %lx\n", pending);
 
 	wait_event_interruptible(ud->eh_waitq, !(ud->event & ~USBIP_EH_BYE));
+	flush_work(&usbip_work);
+
 	usbip_dbg_eh("usbip_eh has stopped\n");
 }
 EXPORT_SYMBOL_GPL(usbip_stop_eh);
 
-#define WORK_QUEUE_NAME "usbip_event"
-
-static struct workqueue_struct *usbip_queue;
-static DECLARE_WORK(usbip_work, event_handler);
-
 int usbip_init_eh(void)
 {
 	usbip_queue = create_singlethread_workqueue(WORK_QUEUE_NAME);

---
base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
change-id: 20260529-b4-usbip_eh-9f21939c8b5a

Best regards,
--  
Heitor Alves de Siqueira <halves@igalia.com>


