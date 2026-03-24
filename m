Return-Path: <linux-usb+bounces-35377-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCk7MhFlwmmecAQAu9opvQ
	(envelope-from <linux-usb+bounces-35377-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:18:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB803065B2
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E6813031CF4
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A183D524E;
	Tue, 24 Mar 2026 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i2Qxixhj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F213E387587
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 10:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774347531; cv=pass; b=kPfrwTq7obsELb+GXIilRJSIfdTpTO5DGbnzlF6h/tkct5AKyxhuSMDCc2fu2dOWFZCWymvbS9zhrKHBEXgkcjHS8JqKLXW6ArdsWDZwESupCnWfva83l+iNMNT2W2wzonoLSHzBpI77IUSSW7q5ezsSxvSR1K06zmorFrH41dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774347531; c=relaxed/simple;
	bh=ewVPVKsQc4O5oWNo2p5+POU7qcTHxn5N6PuqzZ7oPng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yf9TPHZNia92IwnpBgEA8mH1R5aqIxWNhtJitybFx1GMdnvYjF5LT1xw4MfTwOIp38bOSIl4P+1FsLu5miiI0pFrM+UA3iYogbAGrbviNOSgJVyz4NUmM8MC9tzkEOdXJgHmEJuJJ6aapyCxsdNF7X0H54td3/YnR2re4hKa0Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i2Qxixhj; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35b98def50bso3696119a91.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 03:18:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774347529; cv=none;
        d=google.com; s=arc-20240605;
        b=V1ae0mIcj7d+Jwe91AImGdsjaBDNThHmaTMEnUABa8INkTkXbiqfZGvXafsJRJVWbL
         NjHd93Y/VPHb1cr9cnjRuLnEGmHTKYQODpKiTdEUc9NdvAS4Zm8Hc95ck3o5xdQQckoT
         FxEobXtUblQlLdSvTx7DR9rnuL6gpF+ZUeREgkAMRViPEEcv1EpbdHVZv0axVLWhquLv
         Z2MUscaD73mRA+Mz40fC7LHHf6xVx/KR5fMcJd7DLd08fcLgdlv05vNuRq4uFWHjPeBm
         ALIlEbJKWvnthX8mi+/mgrBj+IrDGB4af5Kr2gl9u8iTxUkvvNdH2HLzW2DlkhHlA3U6
         cWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ewVPVKsQc4O5oWNo2p5+POU7qcTHxn5N6PuqzZ7oPng=;
        fh=sMFL5VjYqzv09Az82evsfhrvPvDscYzqgoxtZcLpgBA=;
        b=OqODELHO0y7WvVmtnAbfk65CAfmPGkVCyMPlFlyRgDeQu0JGZEZT886wUNlBOoBq/X
         fDg/kRufwHQ+H9k0lLJeRqQKdpG0RoJFfRBDiz6/dvQKQkL9bsWcVkdZc0NoupvShgSP
         W7PZPvZ67mbu6nYfbOIalrY3jERnf4oVNfQBLedc8+dYeN6k97XumZjJeF37+8RpP3YT
         PKyocXwKOYvdzEF8OAsyQ2RUufosRblc8e8+5YHcGg4z2NZy5XAPo0kkfDYtOuSGqSSJ
         y/UW1uBMO4H2SJkmxNDdSC60IFIAvR3jE3V9I1x9V4HKBkFTjOFg+Thf500gUcnBwiZO
         rS1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774347529; x=1774952329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewVPVKsQc4O5oWNo2p5+POU7qcTHxn5N6PuqzZ7oPng=;
        b=i2QxixhjAuAwznmukz8Fob9B4FW3WntqrQWJyAVW9VOX+FnKFeXl+mHq4Re2HrKMks
         VaFKHA1v57ynkWu0SQQ3Cka3pJ73Rm7jsOzVlIKb+gz/BOCkQyuQSvTRVbVyA9orqu5m
         zPuZAfMqrPZ8U0vSd9cmL6gYCXEvTY8IOtr6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774347529; x=1774952329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ewVPVKsQc4O5oWNo2p5+POU7qcTHxn5N6PuqzZ7oPng=;
        b=PQxAz7dmW6SVeEm0CS03iTFkcDcArkf5y/XhAiS4PQTow/qLej7R/RALQbfAWI67T+
         mM3VxBi+x02W9Too9RpuW5m6bcs3irriyjEuwkwet96n2j6XYaTYasME6Un0lAzzIKtF
         xtaug22M40rbi0dZvV/gB0Sywy1zX4s5StC5ZyLEkFCJ5u1j1OTwmeF2K1pJeZKZ4Tvd
         ZzeeqYJLzDQk5+0UrbSs4miwx23ejD40ZNInNz7LNzPd/7MO8/qgJJNOmfQ9QJmx57vv
         2W861qk42/3dELVBKyhFSeorPxf1d4cLa8Fu7HqXJSaBlnSXwWBjDFqUuqKthThMqoEH
         YNFg==
X-Gm-Message-State: AOJu0YyiBRj3smQ8ih/JjTxw95Trqw9D0cTkl88uQU+zdiMFZtouezGm
	Z+VBqjSw1cSz4ShC+WjHfDtDXizjRidfgfIqtQW2CFXH90Dp4jtY+5vwMfs4bKirGTv2PDpFLhR
	FwCaQnLtBq8fSNdJYU9azf0POr1l2q/W8akMnIXYi
X-Gm-Gg: ATEYQzxqoTWtzHbdd9/JRWIHRDuzWM4Fdi76gsU682/68nXLKaSgIlY5VYf1bcieo45
	hkRTIo7JW+gquQk+940ERe8C97LyNp2n9LFolxcLO7k2QNi6Yfy0O+8w2eDyMhYERPkNqeqrGql
	Eh3Y4MlaHiB3cRVu3dlrUyZqxCKXdgzSALgQ8M2ydJyykGhXBccMjbz8sTEoEfOxLlVhy9K4lfI
	ql6mdI6Ij8lNxptQW/u4ZGSHkFOXWdwvtBjx2m5X+69uNXHCeNWAUX0oKyZwPva/Uy0P8NNj0Bp
	aOGvnCXdF2bN32wtPXztR64fOtvJnfRXaw==
X-Received: by 2002:a17:90b:4d:b0:35b:a170:f266 with SMTP id
 98e67ed59e1d1-35bd2c2090dmr13963549a91.13.1774347529389; Tue, 24 Mar 2026
 03:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324090223.919832-1-akuchynski@chromium.org> <acJfU2qlyj0QLUQU@kuha>
In-Reply-To: <acJfU2qlyj0QLUQU@kuha>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Tue, 24 Mar 2026 11:18:38 +0100
X-Gm-Features: AaiRm51Bu-QEXUTuKIqctp12CP87QPeoBMeyAApspX4I_qofarZci7IjHnTaqaY
Message-ID: <CAMMMRMczS=DOMSRXC_1eTTYjbjCmBkv5EiHFdRgT7JL9c3wZ6A@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: thunderbolt: Set enter_vdo during initialization
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Madhu M <madhu.m@intel.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35377-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akuchynski@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,mail.gmail.com:mid,chromium.org:dkim,chromium.org:email]
X-Rspamd-Queue-Id: 6DB803065B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 10:55=E2=80=AFAM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Tue, Mar 24, 2026 at 09:02:23AM +0000, Andrei Kuchynski wrote:
> > In the current implementation, if a cable's alternate mode enter operat=
ion
> > is not supported, the tbt->plug[TYPEC_PLUG_SOP_P] pointer is cleared by=
 the
> > time tbt_enter_mode() is called. This prevents the driver from identify=
ing
> > the cable's VDO.
> >
> > As a result, the Thunderbolt connection falls back to the default
> > TBT_CABLE_USB3_PASSIVE speed, even if the cable supports higher speeds.
> > To ensure the correct VDO value is used during mode entry, calculate an=
d
> > store the enter_vdo earlier during the initialization phase in tbt_read=
y().
> >
> > Tested-by: Madhu M <madhu.m@intel.corp-partner.google.com>
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
>
> Also a fix? In any case:
>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>

Hi Heikki,

Thank you for the review!
I'll mark this as a fix and send version 2.

Thanks,
Andrei

