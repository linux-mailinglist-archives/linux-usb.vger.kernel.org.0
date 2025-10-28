Return-Path: <linux-usb+bounces-29757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B37ECC12F85
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 06:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 637C3352FD9
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 05:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C6F2C3244;
	Tue, 28 Oct 2025 05:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jrlq/TbA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9565129293D
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 05:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761629646; cv=none; b=EbaD6DhatjIqO65W/2nHxbfOET6Sc9rlxAkLEB2ufMGcqQ4vQFGe9EQlMr8x6GZS38w7MncEgWl1vida+R+Lc6mX6bnVt11eflCb6xZWtXl4ObdlfQ8bLWmkMb1bUIB/WulCCXuLMCNZ1aeWE4VYU+7pZdKVmG7oc8zS4LeKFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761629646; c=relaxed/simple;
	bh=UX3h0Pes41IJIATGA34ZfcGcoxGHwBRZyrCwKR+AqI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktPS+6ZMhya1JJKE0qoCk0gQpGEw5ph2sL2JVX5qKpfE2tzDHwsOWOJE6t6eZg9M3w6xFEnejNtlWwBbhg9V27Y5Q4O7csJzVNUHkO1PzSuZ7FYB45uOAruaIzLphFvd6yB9SauBr9npojBoer4VeQBftOarJSF/VaaVczzxLpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Jrlq/TbA; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b6d5b756284so1173308566b.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 22:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761629642; x=1762234442; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kLpGC29sIJuMD8EW6D6+ekLf15xOznYOaep7iLxbnWw=;
        b=Jrlq/TbAcxUOQXH7JKY2VrMQdRCBUKz+ekMURhnEx2nbc704TyavMsuUcHNNH2Cc5u
         8HueqF3z2/KRHm5Pq3GkpToz2mHs1rRdxdljMyBrGEgXLSB7qxlfakY+q4O9or322CbM
         y/3hMeXm9eBufg8l+1GL0chFUHb5ifzWo2sXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761629642; x=1762234442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLpGC29sIJuMD8EW6D6+ekLf15xOznYOaep7iLxbnWw=;
        b=iYP6I+VIizgLWMDs3nH3RvumlnK2eoxkRr1N0rWRbEeHfGzRTYxbICbRBbms9mR+eP
         9lWAhPULw+y5xc0OVnIwELpjqVUMGr6DCxvWb7asED1KWQ14dWV3MIh+psgnJsnGUI4y
         FRHuS43OI8Ywe1pBUBFLLInJcfdNhsN6wuiGGQ5BcmLcMXWnbOZz5giAHqH8Lvv/EqZG
         Z9jJTX863xbtEn9jDqpCPu70BDey72dCmgBj/LMhSTxsVNG10Gyfp3WBjI3iqOV/bBx2
         gZ2Hr3hNJ2j/mUOqgDZu4kc1mm/6+6WVPsaMHgF9IJgYNqnDW9KT15Xbcpw3wwIXgygb
         hBWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpuCcQ57M66AfywxiOyMutEzlv4T37HVAvBlo4DQ21RKp5G64MSyOBVcuiKo9omHkkDNOAOs+E3kY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLIfxEMfNNfKmQUgn/mkIf03tctxLq+yMGQrWlxaJIEtxtQwSF
	mVee0ObDAGBkki+cwYS44RaIZhmRB7Y5Fw6hxLfrgCjLTrAUL6tARrsyb0jxrJGoQ5jXVYEuH75
	hl9HrJ6rNKw==
X-Gm-Gg: ASbGncu6/UjA7Vnp6aYGqHqbBenv37UAV5VApJrGQ9v7YZ0s4CSISum38RnjRFq7RCi
	XzRedeL2iO5qEDbghlalokgo5mWmOsilKq3utHDzETo1XX0RzTWuM9S8J3twFOKntT2rSrx8EuQ
	CCQMU2fMjI0/qip84jii5857Xx/RML4mVihnX/cWuV8mIM/KcTfHCQ5MFPQoI7Rx1gOVXcqhcAK
	6GzJ7SrjsZMsdSPnh5T+mjptdu9yLd9bkyolZBm+cKNDUOxEChBM/91GvRKUaDK5Ixk9x5Q2e9l
	Gkcsi6uKC7Dq9FPDD7RCBknnjaWqZtEZoAB+za5WvBvq++FQ4a2M6rLSn2/QMrw8BB37/L++mh4
	StU7v5448trTwyE2IzRKISzre4ukgCkorMnjKRlfwLUWmzx6LDdTpjEDOPDLAsb3yFmcwGJTGSJ
	2VG0/JGtQzLHMrXj7vJ1sIJHQqJfEfecY+bM0ALzPSEptll0NyBc1Qrs8KI58B
X-Google-Smtp-Source: AGHT+IGOMVcF5V3hNmPgEmd93TKoqjL7guouh5ESGuwbRvBzbnqpxKaXrN3+2xZfC748eUDasnvIqA==
X-Received: by 2002:a17:906:c10f:b0:b3c:896:abdc with SMTP id a640c23a62f3a-b6dba5c0e6cmr200661266b.60.1761629642573;
        Mon, 27 Oct 2025 22:34:02 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8541fb5bsm972352366b.56.2025.10.27.22.34.02
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 22:34:02 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so2483916a12.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 22:34:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+la2q9yuij1ktd9qK7F1U1KhVs0GrxGmrpkb+zGmIrsTDmSPDNtBnJ+wQ3bTQvirbBCIh04OLySI=@vger.kernel.org
X-Received: by 2002:a05:6402:2681:b0:63b:ef0e:dfa7 with SMTP id
 4fb4d7f45d1cf-63ed848cba3mr2102592a12.6.1761629641674; Mon, 27 Oct 2025
 22:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Oct 2025 22:33:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg_FZnLha9Qr2sMQPXa1go4FPq2p5d7CnMoOnCimS2Wzg@mail.gmail.com>
X-Gm-Features: AWmQ_bkfyF7pn4e6fUY7bNVBhf2DrgjCvQYqt5ZlzergSjGB0BKOD2LLrniXl7E
Message-ID: <CAHk-=wg_FZnLha9Qr2sMQPXa1go4FPq2p5d7CnMoOnCimS2Wzg@mail.gmail.com>
Subject: Re: [PATCH v2 00/50] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, paul@paul-moore.com, casey@schaufler-ca.com, 
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com, 
	selinux@vger.kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 17:48, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Things get simpler if we introduce a new dentry flag (DCACHE_PERSISTENT)
> marking those "leaked" dentries.  Having it set claims responsibility
> for +1 in refcount.
>
> The end result this series is aiming for: [...]

The series looks sane to me. Nothing made me really react negatively.
But that's just from reading the patches: I didn't apply them or -
shudder - test any of them.

            Linus

