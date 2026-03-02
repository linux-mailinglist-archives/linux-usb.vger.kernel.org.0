Return-Path: <linux-usb+bounces-33865-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHy0EW5jpWmx+wUAu9opvQ
	(envelope-from <linux-usb+bounces-33865-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 11:16:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F15FB1D63DF
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 11:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C06CF301A797
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 10:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B572765E2;
	Mon,  2 Mar 2026 10:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iYGDt6uG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF1A3093AE
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446549; cv=pass; b=GuYG6UGxjpnVVg4IP54Pmdxeu/om6pTiCwzZOX0ugUeDzN5wJ3rLVFcPHOuNBUJdxiw7/EpgYtCoTKAiR3TvKqhzcsvfbmhMAPOEknX9ThN3yNV95nsxzVOXDIPfk7+xlXnyY0JMHHPYE4zm0CeCAKi38L7CBSw08uU56H2D7Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446549; c=relaxed/simple;
	bh=Q/v+YTY51gie4NugySLqDaxDDXm98p+rlbUG/WfXHzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BhWB/aMrUUZpW7S+piBIoO179kQlOTMHf6d4Wibgf2RQ2gsSiJIS0nly3CWwUCuJDxKZR6Fo8Vhqm/FAr30vJm4vEcnG+0DnShWoxeSOoKHIgpSPSrSE/Iudby4iOsAoAbi7vY0q8YWLBsuXSOE3MkLkisXMJzvwxp93k4/1pRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iYGDt6uG; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65f3a35ff13so20835a12.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 02:15:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772446547; cv=none;
        d=google.com; s=arc-20240605;
        b=PRohoq4FAs7l0IsUNZff6z64PUXs2tEipy7GOKpcjiU9P0PY1MMulbFGd3uuf/a8Um
         l5WnXc4iRuoxHQSeEkePQgs0vS0E28/8qTLkbCzXLl02yzxm1wiloRCiQoeWfmza5IBY
         Zj7YXQu0EuQ2yynuep6zJjKtcNNaeT1GXmr6jKgnUhguooOH3DsCr1ffb7ahvWCx0gKE
         nK15/WjwCx78Saf5FRn4BK2PfBB3dWyyur7NbybY2neCpSQD034cD3B+fmYTzS+izBtl
         vceG9UhBYZn6qAZYxy7uc4Hg7t1K8U+QPE8Ln09YGAyq2XlcmfkX6yhM60ZZPBMAWY00
         7WLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/24R/TATeaI405YdlfVqYjzvmezGNW8YW44Qqiri2dQ=;
        fh=V8eRlD4MFqWx8sK6RF+g/kzBPNmjKa9aFDjCRnGi1R8=;
        b=MD651w+xNz0lIu6k+pvP/PfwEXHpGfpiMd1o7zR3GD5A/je7j/dHP84QDGzqnAHKtq
         8NhUsawfWA0YZU+Y4WQt79n/Q0KTfvCiyuC+fgOiU9ZSs4TkFhc2BhGZaajvlY9x8vui
         EdfgIRSNUXtlR9PvnaJiKbVqk0qXIspdhI2lCZNHGI7mC+znmqKUfQorhqO2+NPCu5Y6
         m4WT2ngMNwv5eCZv31UzyMoxswRJs+O7sf8E5RAc6cEadEn/cn1Rxh7BhRiRQw8dbEil
         L7YZqtEGTDOhtnHynJd8Yf0xGVzRdXviujjSTUZv3ZGF1wri6WB6KESsPzCVV3Jq+v/t
         qE/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772446547; x=1773051347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/24R/TATeaI405YdlfVqYjzvmezGNW8YW44Qqiri2dQ=;
        b=iYGDt6uGMKhpzXK4AjcnjgJOTUb6xK5eBKzKwkFn5QvhSICEeRsgDwINrmyMHka6x1
         BTXon2oqWAQ5SDVgPggiObQ/RlF97Mxy9K3rgZE3eXobgr6oWgX67VZDDGoZ8dJt5MBA
         gsULODzN1vBtFr3BPX0o3R0zXqgMYOA0DNOMVhtGFkMiOBIuCiYRw57iRXt00vtl9SpG
         E26HutVU/6Cfsd+pc6kG7rMQsi7FHcrfa3BT0vs31PrwK/WWH/RnIB362BDajFwPocAG
         DSCquw9gCc0k6Y/GLLHo56oSbXTVaglSiw1tbMWK6lsmwCHCqDEqoaQrshSBeOI6saao
         yvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446547; x=1773051347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/24R/TATeaI405YdlfVqYjzvmezGNW8YW44Qqiri2dQ=;
        b=lPjQ5oUAbxOlqcAv6NcOxKbbzSj3putovMa/UJs8UMSJf40EM2dqiHEtzf+4YzH+ZP
         lj3Ybahgor8+9yzbPrf3pgeUM32mazSDsqyUvvZxenNAKiOPoAyrXXLLzGAsAStMu1JJ
         ibDOOXIWwe113Ovnry/EVBUVHXwtHsdMU0doEZ4NbowgciiafZzeBzVKpWRjuquziOlB
         G3jMX6O9PZmEhYHug29yDYm9TnD04L1mje51MlkPAsWBJtQpd9Z+mp9oQ6YK8ZMCBarD
         Iof5/TnnK8jrfjvgbHsSCiOF5UeIKnMM0AmviQqVjZOAV7RY7WnPLbHsnZcL5NHCmLSs
         RT+A==
X-Forwarded-Encrypted: i=1; AJvYcCXGCgv3TGlk2PsJOWRRNKsl9IlS/m8N4O98gDOW/Mvurf4IGACNiyw/kZLJsRya9BcxEJHjmVN0jW0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+zRH9bST0ghQWjlyovtjIZ1jlZFl8wVSRFkqmiKINfewkYbKj
	SPGEKdLSnA5HpochK/XudFsXlQpWNRjGmct4ccw2TKjYb2e/ecS/zLKDTrGVhlZ7r70cZfUUF8g
	ziK27r5NiwI2q7ReLnZO0QbVxov3usEGMJV+lG4yEM8gxndGp3N+sAZVk
X-Gm-Gg: ATEYQzxuGmJIET1kLuDgc8IZeS1q2BzNFowGkDRpf0vVuhjuRGHg5vEoNz7QuHisN2f
	x7QoDu4bHHFZUGna6+0xvmyZ6QkPTJJXszef7Gu/Ma3J8e/ophHDZ8/xzh8vTyBJthaTGCd4tHd
	f/PAjWL08DQhSnOM9pNH4FTvmTVoVzE4sQdUq7IMLjkoFvhrQvJRVGC1AmM0XK8UGB/jXQDZJKL
	BKy5rRp5JyStH+WVMB4HAwt1GZw1gDJbiCkaMFfVGZyLHrpqvLwnRQqhxW5pY1MAFIApDhqxEWh
	xIWzsRTRFVWTa7nYEpnJn7ZsI8OHKrg+gA==
X-Received: by 2002:aa7:d88d:0:b0:65a:3032:5f99 with SMTP id
 4fb4d7f45d1cf-66008e11ba7mr172885a12.14.1772446546129; Mon, 02 Mar 2026
 02:15:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260221-legacy-ncm-v2-0-dfb891d76507@google.com> <70b558ea-a12e-4170-9b8e-c951131249af@ixit.cz>
In-Reply-To: <70b558ea-a12e-4170-9b8e-c951131249af@ixit.cz>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Mon, 2 Mar 2026 18:15:19 +0800
X-Gm-Features: AaiRm50vMX_eo6_AJXZzLpaCWOHLyvOuYGZscw5qv7DwPuU-RrZcIb6Bq7AGNKA
Message-ID: <CAKzKK0p0d1MCuOm1O3JCz3mF8jr+vV3NnDN9Wuc_A2OCgiRz_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] usb: gadget: Fix g_ncm regression and atomic sleep
 in f_ncm
To: David Heidelberg <david@ixit.cz>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org, 
	kernel test robot <oliver.sang@intel.com>, LI Qingwu <qing-wu.li@leica-geosystems.com.cn>, 
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,kernel.org,intel.com,leica-geosystems.com.cn,gmail.com];
	TAGGED_FROM(0.00)[bounces-33865-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khtsai@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F15FB1D63DF
X-Rspamd-Action: no action

Hi David, Greg,

Thanks for testing. I'm sorry the patches are causing trouble on your setup=
.

On Sun, Mar 1, 2026 at 5:03=E2=80=AFAM David Heidelberg <david@ixit.cz> wro=
te:
>
> Hello Kuen-Han,
>
> sadly this series is not enough to fully fix the usb issue encountered
> on qcom sdm845 platform (namely Pixel 3, OnePlus 6/6T etc.).
>
> I didn't debugged deeply, but without these patches interface (indicated
> by NM icon) goes on/off/on/off indefinitely. With your patches it seems
> stable, but I'm not getting the DHCP address from the phone, which isn't
> issue at all when I revert the 56a512a9b4107079f68701e7d55da8507eb963d9
> ("usb: gadget: f_ncm: align net_device lifecycle with bind/unbind").
>
> I think reverting the original patch would make more sense and then
> follow up with new one.

The net_device lifecycle change puts us in a dilemma:

1. If we revert the original patch entirely, the NULL pointer
dereference and dangling sysfs references come back on Android.

2. If we only clear the parent gadget pointer during unbind without
unregistering the net_device, the sysfs entries still dangle.

3. If we clear the pointer and unregister the net_device without
freeing it, the device cannot be re-registered unless it is
uninitialized.

4. If we fully unregister and recreate the net_device on each bind, it
breaks DHCP on your setup.

Greg, do you have any thoughts on the best way to untangle this? I am
fully willing to submit a revert for this series to restore the
expected behavior while we figure out a proper architectural fix.

>
> Feel free to add me into CC and I'll happily test on the sdm845 mobile
> devices for you.
>
> David

David, could you share exactly what OS you are using (e.g.,
postmarketOS with an sdm845/6.18-dev tree)? Also, could you provide
some instructions on how to build the code and reproduce this problem
on a Pixel 3? If you have the time, it would be incredibly helpful if
you could dive into this a bit deeper on your device to see exactly
how the DHCP daemon is failing.

Regards,
Kuen-Han


>
> On 21/02/2026 15:48, Kuen-Han Tsai wrote:
> > Commit 56a512a9b410 ("usb: gadget: f_ncm: align net_device lifecycle
> > with bind/unbind") addressed a lifetime mismatch where the network
> > interface outlived the parent gadget. However, this introduced two
> > regressions:
> >
> > 1. A NULL pointer dereference in the legacy g_ncm driver. The legacy
> >     driver attempts to access the net_device during its binding process
> >     before the NCM function driver is fully initialized.
> >
> > 2. A "sleeping function called from atomic context" error in f_ncm.
> >     The current implementation holds a mutex which might sleep within
> >     an atomic context.
> >
> > To resolve these, store the configuration parameters (qmult, host_addr,
> > dev_addr) in opts_net until the network device is ready for g_ncm.
> > Additionally, remove the net_device pointer from the f_ncm_opts
> > structure. This eliminates the race condition with configfs and allows
> > dropping the mutex, preventing the atomic sleep issue.
> >
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
> > Changes in v2:
> > - Remove the RFC tag.
> > - Fix NPE in gncm reported by the kernel test bot.
> > - Fix a "sleeping function called from atomic context" error.
> > - Link to v1: https://lore.kernel.org/r/20260214-legacy-ncm-v1-1-139c5b=
cc6636@google.com
> >
> > ---
> > Kuen-Han Tsai (2):
> >        usb: legacy: ncm: Fix NPE in gncm_bind
> >        usb: gadget: f_ncm: Fix atomic context locking issue
> >
> >   drivers/usb/gadget/function/f_ncm.c            | 29 +++++++++++------=
---------
> >   drivers/usb/gadget/function/u_ether_configfs.h | 11 +---------
> >   drivers/usb/gadget/function/u_ncm.h            |  1 -
> >   drivers/usb/gadget/legacy/ncm.c                | 13 +++++++++---
> >   4 files changed, 23 insertions(+), 31 deletions(-)
> > ---
> > base-commit: da87d45b195148d670ab995367d52aa9e8a9a1fa
> > change-id: 20260214-legacy-ncm-8c001295b343
> >
> > Best regards,
>
> --
> David Heidelberg
>

