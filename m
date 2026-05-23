Return-Path: <linux-usb+bounces-37954-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FixMMcvEWreiQYAu9opvQ
	(envelope-from <linux-usb+bounces-37954-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 06:40:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFB55BD22B
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 06:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 895223018764
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 04:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E531C29B8E1;
	Sat, 23 May 2026 04:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ra0G28BC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358382773F7
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 04:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779511236; cv=none; b=CMv6gmVf6suaE4CNlUMTH+FkRW7Rvo7hNf5fZJP7ONrp4YsZfgOkPvTt1ph6g6RFPn9OcX+ZwiZikkEhirK7YyRdY7L9N4t0TprCf6wN6KmBaA7IR5uuLSIn+B621eLkR3wz5zdx9xcK8aSmnlDQZna4fUsEjcESASB6CkcBCXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779511236; c=relaxed/simple;
	bh=MYO+5GPRBapGsndXUJPFkAiwPovHtyjUKs7kyTRlSD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f0jKg30uKd2KzndRDB5tHRIPBoCwmaLykl0Bh4xhQUsyemtPOhhcmpJI/EqH+ER2FYNK+Lg0VVZtPut+bpXl/+jps0+m122Dtpb3MB+K+OX2Sd661yZMyrU5g+KHz0G/MRJ5vqHhLa482xszWNkvkGP9zA4Zn4rAu7nZLan55gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ra0G28BC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d73422431so5659402f8f.2
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 21:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779511234; x=1780116034; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBVGVuvOrrOmvP6Vp61qg4OsJ+WUFygZKDqZn6utnL0=;
        b=Ra0G28BC3uDAQ48GNugSeLC+TBej85Ip73yFHLyxStbAdOswgKK+6aGP8htb1yDLxk
         BCEshZSHpsEqj22JXkjQU43sYSR8ZMcjiYD7SnVR+hnGMF65xfENYhw5xvNV1u9ZY2yD
         RYU2zV6I3Ja07sA7Q3dsMOZJxPCi+O3C1ivmxWQOe+W5YPH/9sn6v3bMKfMEHUSd/HBU
         aT8V3I8UHWk1wussVFePDW+UgZHLu571Y7YplhDKyAeJlnCUF9dMEV+MVAAfpqK+kGgJ
         6yxjH0oTD4Lzt+gF4+Y7uQHsU6RC5ZL2vfGFp74lhIZ8aR6uh9fqUYKE/eMSDzz68KaO
         jjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779511234; x=1780116034;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBVGVuvOrrOmvP6Vp61qg4OsJ+WUFygZKDqZn6utnL0=;
        b=SM4n0i3h8nHJWTZGCHVhtcEp92Xp/iYq70htzsSVfz1W7bwX041cGKskAdLBI7LAAb
         sdGQTwRLeuwBtdAYly9I8TXAMxmDAhDaR7eejrtCauRUGNbKzQH+VQ1xJ6tGpjxp7/0U
         pg/r93oK4lWFD4nk5XHMAA5vSs0bDgAgIQL61JhgOCH6h/GJy0dR3/1sE1F1PC8asp2i
         VljBNz8+QTIRsY2Yt4XJH0mNzZ5v6hWQU7TBZvFhaXWco8qnX2XV4mOHqoKJfAY7DpZE
         2DnnMpTIMYuEqh8eHB6Ha3DoTLwDFmYpTcD7AGr9AhiFeF0m/dTlLMeBUQ0j3QWx/4/V
         fUOQ==
X-Gm-Message-State: AOJu0YyVXzX6eV/WR2eSeq2d0toz61s43tuioFFAdBG5f3Ub/h+yxJMt
	yn2PcfpcIv4y+PL+O7sBxNmASituXY4OZOPAkN7GRRp99ciei78ReOG0
X-Gm-Gg: Acq92OF48ay5cvC57v4b+F3GSyteWVNspBhaav5cE/NSmpQb+gOI1gJXbb624uiIYr3
	n2OggvWoCm261kzEDCdKFDz9EeiQYEF+369mRFC7piM7Y5uFriSgRuAoQPm8yeWZdo0UUfTuSmP
	G2Cir35Mlvay/PSjLj7HwjiUxl8rM7M5jOypAYS9b4JcZzcvbaTY5QcLCHGuBcaVA2Fo0Ah+zfa
	eTuZH9ozsPp8bP8XkXtBVV8h5RWKoNaGAM8HtIxf+uSIgyFAgmxCDk3HZMNYZLO1JcGK0YNui5Z
	7aEkWts0WiiaEe0fZHil+uTMiSfhJI1ITiWGFy6WG6VXEOSiHgnFMe5q/ArzR6Z5oOk397sdAw4
	HV5fDXCuhbMJroz2T0MQuW3IQBIn/cB9d4sIeFh2Ea6NvRWa2v2k9t8uXMs46E5Gcu5dswItVc+
	kVdvH8anGF38F7Ctd4s/EkdRyF+vCV9rqFrA==
X-Received: by 2002:a5d:5f8d:0:b0:44f:db87:8919 with SMTP id ffacd0b85a97d-45eb36890bcmr9898438f8f.4.1779511233490;
        Fri, 22 May 2026 21:40:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd351csm9638497f8f.14.2026.05.22.21.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 21:40:32 -0700 (PDT)
Date: Sat, 23 May 2026 07:40:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vardan Mikayelyan <mvardan@synopsys.com>,
	Minas Harutyunyan <hminas@synopsys.com>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: dwc2: host: fix logical omissions in
 dwc2_process_non_isoc_desc
Message-ID: <ahEvvXixWpk_0P0q@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37954-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3FFB55BD22B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[ Ancient code...  -dan ]

Hello Vardan Mikayelyan,

Commit 3142a16b9816 ("usb: dwc2: host: fix logical omissions in
dwc2_process_non_isoc_desc") from Feb 16, 2016 (linux-next), leads to
the following Smatch static checker warning:

	drivers/usb/dwc2/hcd_ddma.c:1224 dwc2_complete_non_isoc_xfer_ddma()
	warn: passing freed memory 'qtd' (line 1224)

drivers/usb/dwc2/hcd_ddma.c
    1198 static void dwc2_complete_non_isoc_xfer_ddma(struct dwc2_hsotg *hsotg,
    1199                                              struct dwc2_host_chan *chan,
    1200                                              int chnum,
    1201                                              enum dwc2_halt_status halt_status)
    1202 {
    1203         struct list_head *qtd_item, *qtd_tmp;
    1204         struct dwc2_qh *qh = chan->qh;
    1205         struct dwc2_qtd *qtd = NULL;
    1206         int xfer_done;
    1207         int desc_num = 0;
    1208 
    1209         if (chan->halt_status == DWC2_HC_XFER_URB_DEQUEUE) {
    1210                 list_for_each_entry(qtd, &qh->qtd_list, qtd_list_entry)
    1211                         qtd->in_process = 0;
    1212                 return;
    1213         }
    1214 
    1215         list_for_each_safe(qtd_item, qtd_tmp, &qh->qtd_list) {
    1216                 int i;
    1217                 int qtd_desc_count;
    1218 
    1219                 qtd = list_entry(qtd_item, struct dwc2_qtd, qtd_list_entry);
    1220                 xfer_done = 0;
    1221                 qtd_desc_count = qtd->n_desc;
    1222 
    1223                 for (i = 0; i < qtd_desc_count; i++) {
--> 1224                         if (dwc2_process_non_isoc_desc(hsotg, chan, chnum, qtd,
    1225                                                        desc_num, halt_status,
    1226                                                        &xfer_done)) {

Originally dwc2_process_non_isoc_desc() would free qtd and return 1
for failed.  Not it frees it and then when this loop iterates the
next time it is a use after free.

    1227                                 qtd = NULL;
    1228                                 goto stop_scan;
    1229                         }
    1230 
    1231                         desc_num++;

Maybe add a check here on &xfer_done?

				if (xfer_done)
					break or something?

    1232                 }
    1233         }

Here is the problem in dwc2_process_non_isoc_desc()

drivers/usb/dwc2/hcd_ddma.c
  1155          failed = dwc2_update_non_isoc_urb_state_ddma(hsotg, chan, qtd, dma_desc,
  1156                                                       halt_status, n_bytes,
  1157                                                       xfer_done);
  1158          if (failed || (*xfer_done && urb->status != -EINPROGRESS)) {
  1159                  dwc2_host_complete(hsotg, qtd, urb->status);
  1160                  dwc2_hcd_qtd_unlink_and_free(hsotg, qtd, qh);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Free.

  1161                  dev_vdbg(hsotg->dev, "failed=%1x xfer_done=%1x\n",
  1162                           failed, *xfer_done);
  1163                  return failed;
                        ^^^^^^^^^^^^^
Either 1 or zero.

  1164          }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

