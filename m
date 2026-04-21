Return-Path: <linux-usb+bounces-36397-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKVlEJyX52mp+AEAu9opvQ
	(envelope-from <linux-usb+bounces-36397-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 17:28:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CA43CBC6
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 17:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA6B9301486F
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2026 15:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D129C3D904D;
	Tue, 21 Apr 2026 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="MfDPEGTZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from dilbert.mork.no (dilbert.mork.no [65.108.154.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6141B3D75D3;
	Tue, 21 Apr 2026 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.108.154.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776785303; cv=none; b=HHWSCT4/9q9I8tTWLfhR9wmYycjF4o404N6Mn8CpYSAadgJe7+0nXoVBwHiJFozxJ0FJZW+DjJ3Z1bkvpiIA1Zu7ncckeT8VIcmRAtJOd/evVHJL39B6Ho/JHDv6yUI+YgZj6O63KvWwRY/qSdJKnQVUCf6ttI8uqxzqDJJFVOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776785303; c=relaxed/simple;
	bh=sudIl/MO5640I3hwPUJJDdibc6FcDmokiN6s4Qznqjs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OMjiHScora2XZi4tdsIa4xM2JvlCgjVYzHNocyIShM6Nn7cab+Y3htY+WAVJnHX9B4543v7DUAl979qOvlNr9q/JDLLAgrs1qfCbvokFkoIvHRKMDsvkpgScsZds3W3H4MawtstkCsfKTHerVTEENqMHvEdn47lF0MPj/ZYEtnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mork.no; spf=pass smtp.mailfrom=miraculix.mork.no; dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b=MfDPEGTZ; arc=none smtp.client-ip=65.108.154.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mork.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraculix.mork.no
Authentication-Results: dilbert.mork.no;
	dkim=pass (1024-bit key; secure) header.d=mork.no header.i=@mork.no header.a=rsa-sha256 header.s=b header.b=MfDPEGTZ;
	dkim-atps=neutral
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10e2:d900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.18.1/8.18.1) with ESMTPSA id 63LFRWAm2844840
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 16:27:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1776785252; bh=FGZYfonOzj3LWdcmpezBnWOMi5Dm/iVF2dnKqO4i3aE=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=MfDPEGTZAXpnb1i8xxoO4+LzIzx/z/Smz2dHN9V3Xmk8Qui38dQK7g+n4rU5QZSWD
	 qcIvBtt9PvfjOIcuYjUWyN9tmyOUaINgrOxGZcFr20kU46yw0Ev7EANqUbTIyo19wo
	 5Ph3LZR2leQv8S2i1YSqa6Z4+Mf+UoW292jisiMc=
Received: from miraculix.mork.no ([IPv6:2a01:799:10e2:d90a:6f50:7559:681d:630c])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.18.1/8.18.1) with ESMTPSA id 63LFRWpb2948045
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 21 Apr 2026 17:27:32 +0200
Received: (nullmailer pid 2973842 invoked by uid 1000);
	Tue, 21 Apr 2026 15:27:32 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org, khtsai@google.com,
        kexinsun@smail.nju.edu.cn, hhhuuu@google.com, kees@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: gadget: udc: skip pullup() if already connected
In-Reply-To: <e431e2f9-ce24-491a-9447-1b872099ab25@rowland.harvard.edu> (Alan
	Stern's message of "Tue, 21 Apr 2026 10:37:53 -0400")
Organization: m
References: <20260421082050.1260823-1-xu.yang_2@nxp.com>
	<e431e2f9-ce24-491a-9447-1b872099ab25@rowland.harvard.edu>
Date: Tue, 21 Apr 2026 17:27:32 +0200
Message-ID: <87v7dkpc4b.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.4.3 at canardo.mork.no
X-Virus-Status: Clean
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mork.no,reject];
	R_DKIM_ALLOW(-0.20)[mork.no:s=b];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[mork.no:+];
	TAGGED_FROM(0.00)[bounces-36397-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn@mork.no,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mork.no:dkim,miraculix.mork.no:mid,harvard.edu:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 970CA43CBC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Alan Stern <stern@rowland.harvard.edu> writes:

> This patch is wrong.  To see why, read the comments just below the end=20
> of the patch and see also usb_gadget_activate().


Made me look...

Must say. This strikes me as a nice way to filter out humans from the
rest of the submitters:

                gadget->connected =3D true;
                goto out;
        }
=20
        ret =3D gadget->ops->pullup(gadget, 1);
        if (!ret)
                gadget->connected =3D 1;


The indecisiveness looks strange. There's a nice symmetry with
usb_gadget_disconnect_locked() though:

                gadget->connected =3D false;
                goto out;
        }
=20
        ret =3D gadget->ops->pullup(gadget, 0);
        if (!ret)
                gadget->connected =3D 0;




What surprised me most was that the different variants were added by the
same commit
ccdf138fe3e2 ("usb: gadget: add usb_gadget_activate/deactivate functions").


Bj=C3=B8rn

