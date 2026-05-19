Return-Path: <linux-usb+bounces-37732-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIQfDNSuDGrdkwUAu9opvQ
	(envelope-from <linux-usb+bounces-37732-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:41:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4BD583CCE
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 20:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DD61300FC73
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 18:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC4236BCCC;
	Tue, 19 May 2026 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLZRmr7K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B932C957
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 18:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216072; cv=none; b=ICrGgu9F2Upgnlg7NUmXRjuz6JjuF4c/mLArUqvQllVPoRM1tpGnw/tnysGrTfxh72yZBHg8sZZtCLrK5ruSUe62m733N0sntq6Rngju/xPhudZUdN+q9Fv+pmXRAVVO/FM/uiaDenG7nG8G3ges3U8WdzmHjJWzNHn7YLPFQnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216072; c=relaxed/simple;
	bh=5c1Apn+0X5iWHZ0FXIxTRO3d6gvYs90hLYOP2XRxv6A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rvBjsgS57gZRtGWHZZUVgnzH+7kO/LTlipJk3C82eGuyHjHNFjik9B3ihbsQo/FNJqjRHbDaAsYGSVLJFl0s9AzIi/DT/sivK/rbbUmpStE8gtVPAlJyqsj+sn7hIpsmbPwqk/hnO0WBgNuI0xVUskmKJOvihyknfepEFkHbtgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLZRmr7K; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82faf871346so3085009b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 11:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779216070; x=1779820870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k841aqjf4cI7p/GdFm7EiqPkcmbtYc2RuSPbuNCh2AY=;
        b=TLZRmr7KhVhYy3D2CWB1lAhHTRhbM1AT7U86b/Xsa4/BszOsjNGQrQnNTEYL98sa2i
         ICb6d2wp1H6rzzrvdqAxBo8UbgfxvcHolOavQlYWVuOOo2I4QHoaDr9FGQeN9JxJg1xh
         2GDKm37AhTY7QVmClqVuWCvTiAigL0YpzMlNjJt8CyAv0sBXtCkX38jljBSy5//7Lp3T
         eoBMDbpsEZlcjk9TwganVyJXHyCpevp5P81zIPzwLdAn2c8osAH6BVflvooM6OT3wHIc
         Fy8lVDCoDjBr8FsqBYQWoUH9cT4aWXJ+CG4ND8iYT4HdDp1g+HnHUe/ZrVstmAP3OKlh
         GRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779216070; x=1779820870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k841aqjf4cI7p/GdFm7EiqPkcmbtYc2RuSPbuNCh2AY=;
        b=kPGo0BoMeMLKfSTH8FHQtoBtqjgI0MC4UZyj4xqXc4cq8NOSo5mma44muGKIgUMcP5
         Pdc4e0qbdUogrXPHe9gUWnK1N8Fg+7FBRLu0pIcuOYJE7kRXjeAsqzA0EakJsDUMi94N
         ns8ji5QTTfGEWAkWCpiWrN1kjBTKA4xAxE6WI6Yoh9COGzBsXvyiDl2ciklZBJIxCEB+
         p8ZSyJTl0qysbVj8XSyQfUG4oJ1urfpaxDqV+/b/iNXJlOsw40haZGvKFc4CBmWYfQxb
         LHkmQzfK13o48RS4SQZrD7x+QOBDWkYGiiHe8qyyDmbABQMA7MU1bR2Xm+4Bx45BhNAU
         w+Lg==
X-Gm-Message-State: AOJu0YxrxS47FSGuSP3rIEe/yQzHWFZlLzp7CGZRcPPA68eIhX1/3AgE
	9AA0lKHBU0GITC78gJCV6x82YNzPXDelDN3mJTM4MbpaE7fh3wjKjuLB
X-Gm-Gg: Acq92OGNmfZ1dB5Eja9B2FA3NYapXLCOrNXYIodlmZGFWfsc1S5i27nlr+gICHnKcla
	bqU/2YuHIJnkywUBRKfMII+p/MFs+/rZKLrQzfz4uXM7sd110LyP8vZ+S0BryAxU6H4t9OyNgE9
	x2iCuHaU3E3mU6jUic02fMl9STv9juWsPaFGxrJMWH4qU0CI5t6QdBv82dJTZ1NbwoJL4JxI1+z
	8Y8fnCcyyr6T81VhOpG8loLz1b4UYtkKRcUC2zT7snb1CK9b9TESIFRgAKhkLJb4R9+Q5l+rBil
	bQZrjODSE/3ZQ5jpYWIAIRN3EqxZpAEBvlNx1mB44CEjim6oQP2J4bmg7/2sK6zRiWYk/3ONBPF
	UM7529RcrIPX35H6sGn+t7HLR7bGjCekcNanhN5fmrQpGoUS6KGElcy8K/HcoyZBR51FZ4nUvRG
	mSc3IuAlrBH0KU7DWqeck1u8+ycPlLJVMQVB6rmjo8YWiVuKuJDT/SOdN3lEc=
X-Received: by 2002:a05:6a00:340c:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-83f33d0a2e5mr21025736b3a.48.1779216069982;
        Tue, 19 May 2026 11:41:09 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19661261sm23913844b3a.3.2026.05.19.11.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 11:41:09 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: usb: gadget: composite: dead empty check in USB_DT_OTG handler?
Date: Wed, 20 May 2026 02:41:06 +0800
Message-Id: <20260519184106.2356558-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37732-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-usb@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,maoyixie.com:url]
X-Rspamd-Queue-Id: 8C4BD583CCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


While auditing drivers/usb/gadget/composite.c, I noticed what
looks like a dead empty check in the OTG branch of
composite_setup(). I built an end to end reproducer that crashes
the kernel under KASAN. I would appreciate it if you could take a
look and let me know whether this is worth fixing.

The site is composite_setup() handling USB_DT_OTG (linux-7.1-rc1,
around line 1858):

    case USB_DT_OTG:
            if (gadget_is_otg(gadget)) {
                    struct usb_configuration *config;
                    int otg_desc_len = 0;

                    if (cdev->config)
                            config = cdev->config;
                    else
                            config = list_first_entry(
                                            &cdev->configs,
                                    struct usb_configuration, list);
                    if (!config)
                            goto done;

                    ...

                    value = min_t(int, w_length, otg_desc_len);
                    memcpy(req->buf, config->descriptors[0], value);
            }
            break;

The `if (!config) goto done;` looks like a guard for an empty
cdev->configs. list_first_entry() never returns NULL though. It
returns container_of(&cdev->configs, struct usb_configuration,
list), which aliases the list head. The check is dead code.

With an empty cdev->configs, config aliases &cdev->configs inside
struct usb_composite_dev. The read of config->descriptors[0]
fetches memory at a fixed offset from cdev. memcpy() then copies
up to w_length bytes from that location into req->buf.

Empty cdev->configs is reachable in two cases. One is a gadget
driver that returns from composite_bind without calling
usb_add_config(). The other is a teardown race during gadget
unbind while a control transfer is in flight.

End to end reproducer on linux-7.0 with KASAN, CONFIG_USB_GADGET
and CONFIG_USB_DUMMY_HCD:

  - g_empty.ko: minimal composite gadget. Sets gadget->is_otg in
    bind(). Does not call usb_add_config(). cdev->configs stays
    empty for the lifetime of the gadget.
  - kprobe on composite_setup(): rewrites the first incoming
    GET_DESCRIPTOR to USB_DT_OTG so the function enters the
    vulnerable branch deterministically.

KASAN report from the unpatched kernel:

  [probe] composite_setup: bReq=GET_DESCRIPTOR wValue=0x0900 desc_type=9
  [probe]   cdev=ffff8881106f5400 cdev->config=NULL configs_empty=1
  [probe] BUG WINDOW: list_first_entry on empty configs returns
          ffff8881106f5520 (head=ffff8881106f5558 diff=-56 bytes)
  Oops: general protection fault, probably for non canonical address
        0xdffffc0000000000: 0000 [#1] SMP KASAN PTI
  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:composite_setup+0x38a1/0x77d0
  Kernel panic - not syncing: Fatal exception in interrupt

A candidate fix is a one liner. Replace list_first_entry with
list_first_entry_or_null so the existing NULL guard runs:

    -                       config = list_first_entry(
    -                                       &cdev->configs,
    -                               struct usb_configuration, list);
    +                       config = list_first_entry_or_null(
    +                                       &cdev->configs,
    +                                       struct usb_configuration,
    +                                       list);

I verified the patched kernel on the same reproducer. KASAN does
not trip. composite_setup takes the `goto done` branch cleanly.

Similar dead empty checks after list_first_entry have been
cleaned up in the same shape, for example commit fbb8bc408027
(net: qed: Remove redundant NULL checks after list_first_entry),
commit c708d3fad421 (crypto: atmel: use list_first_entry_or_null
to simplify find_dev) and commit 10379171f346 (ksmbd: use
list_first_entry_or_null for opinfo_get_list). The qed commit
message describes the exact shape we observe here. This OTG site
appears to be missed by those cleanups.

If this is intentional or already known, please disregard.
Otherwise I am happy to send a [PATCH] or to leave the fix to
you.

Thanks,
Maoyi Xie
https://maoyixie.com/

