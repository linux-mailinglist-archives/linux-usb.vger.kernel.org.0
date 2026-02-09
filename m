Return-Path: <linux-usb+bounces-33181-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6vVFAA9QiWkT6gQAu9opvQ
	(envelope-from <linux-usb+bounces-33181-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 04:10:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF7910B570
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 04:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 955C83001CF0
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 03:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C8B2F2613;
	Mon,  9 Feb 2026 03:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHriNJ6x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2BD28980F
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 03:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770606601; cv=pass; b=ZfLIHzWngjZZfCqhvARzdBESeLlWO6mc3G+FrHfd37Jh5Vv1gYjnN6BJkkX0HcPhCD9cRPRXXHDT6tzXwbzw1OGfCDNqVRkZnA69jN5eOyvyK9E9w01G32uIc+MoPObz9MJsM9VC+ZMTzTUAQsUPVJEWyJ2AIZAgP4if4C+RFnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770606601; c=relaxed/simple;
	bh=EfrMOI/uvhYyi9mkT2f89sforFteRRTfRAZsVPzLuWs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WYrDXpVnpVoRtzPCiN8rpN5dODaV+dlN+OaP9HHTGMBpWNK7r3EfkdxSLuRE5rLx3dl6kVtRZqgTvLbIRk+8Fq/GiurtFSyCc/2MQl8bA9BFkNWD7Kt80B2wz/gAoG9TeHvpQv9kz0ooHQerzfJj5h11BPXJpVML6WKIDELxWrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHriNJ6x; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-385bdc72422so35282341fa.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Feb 2026 19:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770606598; cv=none;
        d=google.com; s=arc-20240605;
        b=Pf3XPFewXTm4aCwZBaTtmZdDmVz4GyYj/JgvFomW6yVKOU3eqDYWoR+2+otiPLST/6
         JT2L7f4XC2XYO82i+bc/O/6k0itEivn0k24AvQxfzFGikUSttzNMEcdI3sk+SzpGGDgP
         7sv0qQ1BJ6ABYATCmi5ddnYQkdp1QSJ2PJQHpyy+hQrvjcSLm4AjljVzz1J6nkdA/QdE
         qGdDMIWyBl1melifza01xhZY8oBYbpXq/V58+MLPmZ5opt8nE2JJrXNgTT4EC3dAh0eH
         x1aSl50FNVZhk/MD+O0GXiPEfFZcUSjQfaJ9yQKdbpPJtFdrhBFezhsck7nQU6kwRhSi
         U0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZEBr40e40rtBLUN4Bhp2oGknfiIwC9eVZWvW663BchY=;
        fh=rJYdkLIy7vQETOPE5wEwShLowTre3A2i3j1T0BxPLBs=;
        b=RXotnNvOkLtJZnzDrya7O8XiXF9ch4yHja26bz/o4TK2KOpkDknij5lAYRm48hO4rB
         ZtAD47JXpRBRu/I61ItD7Ed4UyRMRI3aUyBbeHjRZ1Hj0z/igaLDNgUXjUjTX6Uq6eCD
         JoRNM6w4XtGcLQ7Dkf9AhHZGXR/vMQU0ENzemazSdjssZnq+ePjRZn6hA7iYqnpSFuDE
         cDN7MFJDbJuV7CwJcDTaucv9mY4vBJaDkQrqtSHTBDDuvVzzcFjKTjOU3JHYUwTf4jiM
         4LhEknphNcUKBmYB7FJmOevnx/sYIy+lYdvvOSNl9zhg86KIq2NrklWA8jda9aBL+cv5
         /xYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770606598; x=1771211398; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZEBr40e40rtBLUN4Bhp2oGknfiIwC9eVZWvW663BchY=;
        b=jHriNJ6xbveMV7f8WAktGVfBh1xdG7mtJXIOeqZaNNf0//7mvyPfU2hbIKv65OX8Ve
         wnr7VnqW3mqAG+S2QrnNayYl4WtT7xKnlwqpGwy3nz9JQjW+69licy6svXQ/J/0yBJkL
         HkvZd/7GJ1Lcth8J0KQkN99zhQ14L7nKPrZFQ5yqQM1HVVQroiplwoqCEVnZs3w2XCSj
         vxj5P3pPMJe/he+Y1Cv8jTdTciE4yyL/7BSYxoCM9jGZ1wUxdPn8JeIP+hHMPThRagIl
         Af/+OMXv2cusiJd6UVRTyUE8yT2fcwTr9jvctiMgu9kJ5M63s4pM+PrrF4hB/i/3VCQP
         vmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770606598; x=1771211398;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEBr40e40rtBLUN4Bhp2oGknfiIwC9eVZWvW663BchY=;
        b=FZek3W9eYBQmShzk62GYMHHP2G4tIWsTM+iby5x1GcbtWLhRBYNMSGNtIgzHjJIYQe
         7Gz9fVcM5Ntvxhs2jKM78shSjQYek8Rf2NrP7OxOBY6MWsQ9g6gIECoPa+AUUnuO0uCI
         7yMovtt6mpOXLWyEmErNkjOemORLJMwrQToD3BCmXvGDilzCGTCzsxXrSroiU1WKO3yO
         fq0Cpea9KiymkIca0mel5eRlVIFtkeYHFcY8ihUp35Fx/gLuSno0xscrjYncO+ggEPgg
         46JAszw0gNnohpFL6rKelmmje7TJXk31KBOszecvZPdVVwf8CoVwHefyKDloW304jykY
         jyLQ==
X-Gm-Message-State: AOJu0Ywr3TIEzf1EDLXKJ+XSLCP7xuV9eRpkGEoIgFDCRKS0A8iSqgiH
	+eVKdhq/5tgDY/kCku2VitrzKI8FNo0dW4dmNu0IXQ0zMMiDv4ToQKBPJ1oLxKH2B9pGD1dT9lE
	6k1qUPvojxdTpDkAWz7SCOrcsAZH9k1I=
X-Gm-Gg: AZuq6aLFFuYM42cr6jhS7Hog1tOrzSfGt5mrIqStFAx/QGD/zXn8uLAYPtbneqLEvi0
	aVnnLfOEThtfN59QhXvwVpXrSn3BIBvvk21ODzDsP1oJBv0cBLWmEjC33LvoVnNB3dGbSbKK2QR
	SlXm7A8W8+xl63NFakWwiPqD6LnpVdLTQAppFbwKrAaBp6geRt7BgjsngIDFN1ndVCRXlV4alzT
	Ux+9w2um1lVJzxTK3G9jyRNIZAuYAb2vau9M6Ua6Yu5vn8sHQ1PzJ3Db2phx/zRVAhQ1GKGvaLG
	aiYb415b/rsUdwL3ARtE1/E9TSD4lmb7UqdHDQ==
X-Received: by 2002:a2e:a99e:0:b0:37c:c84a:99b9 with SMTP id
 38308e7fff4ca-386b51021c8mr32290491fa.24.1770606598078; Sun, 08 Feb 2026
 19:09:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 9 Feb 2026 00:09:47 -0300
X-Gm-Features: AZwV_QhEvq3UHzgJVD6NPMEt6BZEI38KTodU7lIyQ2HaF5QZWnG3ziZtZeGtKiY
Message-ID: <CAOMZO5DuiHWpu9px2-FDWwBnq-W-jEQj1GMSUpTKvncw4OBF-g@mail.gmail.com>
Subject: i.MX6 chipidea: USB port does not power off
To: Peter Chen <peter.chen@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Frank Li <frank.li@nxp.com>
Cc: USB list <linux-usb@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33181-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1CF7910B570
X-Rspamd-Action: no action

Hi,

On a i.MX6SX board running 6.19-rc8, a USB pen drive is connected to
the USB host port.

I need to be able to power off the USB host port. This is what I've tried:

# echo 1 > /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
[   55.396980] usb 1-1: USB disconnect, device number 3

After this command, VBUS is still at 5V.

Trying once again:

# echo 1 > /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
# [   57.903409] usb 1-1: new high-speed USB device number 4 using ci_hdrc
[   58.107522] usb 1-1: New USB device found, idVendor=0457,
idProduct=0151, bcdDevice= 1.00
[   58.107668] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[   58.107761] usb 1-1: Product: USB Mass Storage Device
[   58.107808] usb 1-1: Manufacturer: USBest Technology
[   58.107849] usb 1-1: SerialNumber: 000000000003FF
[   58.147565] usb-storage 1-1:1.0: USB Mass Storage device detected
[   58.156694] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151: 80
[   58.163889] scsi host0: usb-storage 1-1:1.0
[   58.172623] fsl-ssi-dai 202c000.ssi: No cache defaults, reading back from HW
[   58.189573] fsl-ssi-dai 202c000.ssi: No cache defaults, reading back from HW

VBUS is still at 5V.

Even if the USB port is unbound, the VBUS is still kept at 5V:

# echo -n "usb1" > /sys/bus/usb/drivers/usb/unbind

What should we do to turn off VBUS?

Thanks,

Fabio Estevam

