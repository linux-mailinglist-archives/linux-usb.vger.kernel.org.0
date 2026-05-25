Return-Path: <linux-usb+bounces-37995-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPsYLbTGE2r1FgcAu9opvQ
	(envelope-from <linux-usb+bounces-37995-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 05:49:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4195F5C5959
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 05:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A2F630053EB
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 03:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98797286AC;
	Mon, 25 May 2026 03:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sukvwes6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2A222D781
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 03:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779680941; cv=pass; b=dMg3U2iN/QxrLqktGpR3SaUpknpPLtpGCqgQJQgq8Djx7bSrpSAI0G2u8BFFpuy6AxtdKQk8X63nQuul8pne3MkHJllGtBqMNotTnM2IUpJ90BwBTAwu0oZKL36hM+F+r0mV8OWxaguULQk0rRXdlug99gWZ+72XPPDG1cknf7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779680941; c=relaxed/simple;
	bh=rTx8D4UcJdlhVCBQDSERZhHgU/k80RnRK8QBKWN0RYQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=P/7xSY9vhTfZn9uORxALzo9ihwuc1ywyKVNwp1ESuMxbHdxOFUSNY8cTBMbu9xyLn4z8zzdHY4Zn76rTXNLLIOi9wwXfgmIvXZFthm9pdgifKZ93FQc6rB2fzVjQJ+cSLaqzzvKhXcKAa6vHl070yReNShBuwpjfj5A8mFA33uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sukvwes6; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e582b3bcaaso7878782a34.3
        for <linux-usb@vger.kernel.org>; Sun, 24 May 2026 20:48:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779680939; cv=none;
        d=google.com; s=arc-20240605;
        b=Hav7Ipoy8xNuvkmr3o510q1u3Vzeyks6nK/LJ2J9+YJDEI2IvdwoL62aah/2FvwsnZ
         HcW/6Yr0lq7LxPnb6GUxzP3LqJBVcFUv29horzq9JqnS5U5CpY61clqAg6NLCZGL9LQ8
         /C7h0zBUPb3MZiJTtCQvmKQ1tn5yg18ZoCez9/p7KqWeZDGOA4pQMI1eGXKf6LppgEP8
         n8zXR3jJmvHRUx9X6pXQaJXlEns3H4U7YtqW4K/h5UyqtfY80u1EByqD9NPZ3efnS721
         tKLndXAKgP5QELPixB9u+Vyxe1m/qhq2acI2MsF5+MFohWxzPcDVsu8yQrKEH4evl/jv
         dgNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZwqZ3s+fz2IowxtGp1OrH7H6BgIiCMLMrlQiYx/q52M=;
        fh=jFgV+vaB+pQP2bULkviOpkHevnActo/+FW2k5l5jgqE=;
        b=FXi9PEjdFmEfeJh5/If+wO4ZZo/KxdQ/i9CGYDryMir8VDF5m8sNjJAJZYKnG+j08k
         RmfrYBhslhd3qPhgSGknm6IZUOMFTSSdFQuOEUG8xQERQRm2xAHc5cy2XNkr80K8xQq6
         zNUzfpN7fJglWAJGWYHXYN6qcCUxfaEJc61sTHgc87jkzv3V2sWJZzrGyhPwyM9r4UPD
         W+0trALZtCJHmZJTdTNrwE8AaEglxGISKua0r9CaCR89VLUftxtGPV+iun3vkc8B/bQ4
         dB30k+E535ATlL5BL2vGQmtW2gNxmLmpAle40sX3KhzT8DXTkF5AgmMOM0Tauxhw5j4O
         jgwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779680939; x=1780285739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZwqZ3s+fz2IowxtGp1OrH7H6BgIiCMLMrlQiYx/q52M=;
        b=Sukvwes6IiejQaphXiNRU0fE+/KzjU8ousbRSoejT8m+fg9wO3dKt0pUZhkJzrycuy
         6ToWVpWz8NjGOzH6r0GbNJL/ooy8NYtwAiu5Sow08Y+PFb6L2DaUKe/2Mjxk/suDUJ59
         Zp929TuYlEBsnngDx5gXUDDg/XBBLzbFQv9K6bvFqnQubLyktHzbvMfhlZ92DvCgfEFn
         1MvtNyO44NVwBaQtBOuBYOrNHdMFuwXYD11GsZ+2OX68/UIWTg+ZxQRmReGFqX6XiU/q
         fwCG7wx+potISTPVgALYZ5AEP2IMKAaHk2uGrMCf8DwH+ifTXumHUDedfuhFnepZ9OM+
         CaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779680939; x=1780285739;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwqZ3s+fz2IowxtGp1OrH7H6BgIiCMLMrlQiYx/q52M=;
        b=flVxj2PXSnSMkC/CIuDHEfL0FiQqUkkNnyJ0B2+QwGeMHluhr8Lz6zbvFiyRomRkfy
         M3ue7PiylYWeLYGlq5hmNYuYwZavgMhA6GC3RHN3ZhUBav7VuVf1PRgLFYeTs3BAK374
         CMj5qPQZSRILVBZmfUmdoyX6RlQxdvMyThGEntSLVWrQXriLF42+LuDBh9Xr2PBttRyr
         /EGMRvl3zLwbwZq6j5l0H8BcGzg8b0ryKgggFqfKQYzIki1Mm1wan4AGOMUV55YHkgK5
         VVeeyPGnwqLnIc7kYtkIeU3h3O0ILo6rXhLLFfvJZZiljUPfcdNxtzNsxX0htOsj+eeB
         n0fw==
X-Gm-Message-State: AOJu0YxWThRxRhBtwnQTvawx32SOvddliVgkjM+Ao9dQM/8l0dxSboyz
	grIKcwlRPB2xh2+GvLQRlrpfoOhcn2LB/NJO0RvyDH4jVD3/YZp3n3PM1tqCq4FbTdzoxq9fvKp
	p5ZjeCP7EQb8gRiJcEX1Mff05iD3Vh3OCKl8x9CM=
X-Gm-Gg: Acq92OEVJE/cj7G+d8Wmp4o9QYCDoL2TtOt/q4mMLT3esY5FYYpmExweBEGFzjmN7HX
	qjquqFhwFSACML2q8c6SaviXx7ZV+pmen4sRuGeodl6Unr6upSgM5F369uoVJPDdU0V4jsse5zY
	iyGwL7HhAfdLd2OqdeaeMW+0394G8I2CDONfNKJcQDvDv862S1Fa71UG1djB3AU4gua52NaYzg0
	OszU2wFu47wiw9yJgeq35IJPRqcBTxRuxdSGotUvAgEy8UDqa7CF8IeqwkvvqFG6/2A53grbfY7
	L8ApobWUGn51TkWVhyQXZQlkUQSot3c1+jOARWme7msVDLfnrwstOhGc+xxSGU/vadNYn4lQCeb
	Cbu4tW/xG
X-Received: by 2002:a05:6830:4988:b0:7dc:3db6:f02 with SMTP id
 46e09a7af769-7e5fed893demr7562326a34.9.1779680938801; Sun, 24 May 2026
 20:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Adrian Korwel <adriank20047@gmail.com>
Date: Sun, 24 May 2026 22:48:48 -0500
X-Gm-Features: AVHnY4ILZevoNw-otkjh-DMkD3-TgQyfRZJgzVhQd76nn8nhr2Wf1aYMaGwk0N4
Message-ID: <CADgB2mEykL2CH-5And2m4_k+2Pc6UkWr=zxHGMyXsB5CRJvcLQ@mail.gmail.com>
Subject: [PATCH] usb: gadget: f_uac1_legacy: fix file handle leaks in gaudio_open_snd_dev()
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37995-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4195F5C5959
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gaudio_open_snd_dev() opens the ALSA control device file first, then
opens the PCM playback device. On two error paths the control file
handle is leaked:

1. When filp_open() for the playback device fails, the function
   returns immediately without closing the already-opened control
   file handle.

2. When playback_default_hw_params() fails, the return value was
   previously ignored and both the playback and control file handles
   were leaked.

Both leaks result in gaudio_cleanup() calling filp_close() on already
freed file objects when the bind error path in f_audio_bind() triggers
cleanup, causing a use-after-free detected by KASAN:

  BUG: KASAN: slab-use-after-free in filp_flush+0x23/0x1b0
  Read of size 8 at addr ffff88810d5523a8 by task bash/306
  ...
  gaudio_cleanup+0x59/0x100
  f_audio_bind+0x4b0/0x590

Fix by closing previously opened file handles before returning on
each error path, and by checking the return value of
playback_default_hw_params().

Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1
implementation legacy")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/gadget/function/u_uac1_legacy.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_uac1_legacy.c
b/drivers/usb/gadget/function/u_uac1_legacy.c
index 01016102fa17..5bcd3afd6366 100644
--- a/drivers/usb/gadget/function/u_uac1_legacy.c
+++ b/drivers/usb/gadget/function/u_uac1_legacy.c
@@ -226,12 +226,20 @@ static int gaudio_open_snd_dev(struct gaudio *card)
                ERROR(card, "No such PCM playback device: %s\n", fn_play);
                snd->filp = NULL;
+               filp_close(card->control.filp, NULL);
+               card->control.filp = NULL;
                return ret;
        }
        pcm_file = snd->filp->private_data;
        snd->substream = pcm_file->substream;
        snd->card = card;
-       playback_default_hw_params(snd);
+       if (playback_default_hw_params(snd) < 0) {
+               filp_close(snd->filp, NULL);
+               snd->filp = NULL;
+               filp_close(card->control.filp, NULL);
+               card->control.filp = NULL;
+               return -EINVAL;
+       }
        /* Open PCM capture device and setup substream */
        snd = &card->capture;
-- 
2.43.0

