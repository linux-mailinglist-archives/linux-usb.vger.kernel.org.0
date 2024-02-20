Return-Path: <linux-usb+bounces-6803-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C92AB85C318
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 18:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A706B249F2
	for <lists+linux-usb@lfdr.de>; Tue, 20 Feb 2024 17:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A3B77F1B;
	Tue, 20 Feb 2024 17:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ab81jJE7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFE776C9C
	for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 17:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708451751; cv=none; b=cSGF3UBVUpmAt7mOG+ePV9BHV/vxClKcI/YOl0iN28VkME3xIOIpYICQMZTyYGtc5JC7xWqhTkWc3W6J5QGkgOPPkj7x/8bAYPJDxTlajgEnMLpo+N+tuKcjwpjeuRHGP+s6aPRfbZsd2RYoclbcNBU30rbYWjr5NPf2X1nefbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708451751; c=relaxed/simple;
	bh=hqb1KpK8idTkVHw05D9DaOecFdA77V8n0hYYGqZ4o2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qsUQN1CTyB76sfwuVnsClpyfwuq3bxvBdZAu2LMlbLLv1lH8sO7+je3eXjw3R3syBl502OcfdeRJhThz+IHbaJMagjB58082FMOl8caPHyXQ+4v3CWSFGcg8pR0yBOckCJl+zGqTv8YSETXlJqyiQD5YWmI0CCL2pTl0fvJYPY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ab81jJE7; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55c2cf644f3so7811136a12.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 09:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1708451747; x=1709056547; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cs7a6JxSri8UPMBfIFAC6zzBgd9E4B30piovcQly+DY=;
        b=Ab81jJE7kpciDnJ5EwJA/C9473hy/PJMieFJXVoELmOQlHN1kdZlXBvBYeg2yMEo52
         g+epCK1CX+nDxaDfjoUwaKrsYvPUvFx4APPM2hylpTX4ZmOcQrSh+a49/xP4JllLSA48
         zGk7z6o9SYtKONS0sKuhAc8IB/5+tLtazoVno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708451747; x=1709056547;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cs7a6JxSri8UPMBfIFAC6zzBgd9E4B30piovcQly+DY=;
        b=GulXhI+XLxnUjAnWk0O9N/mDpIqoFsahOMG8rk8KZYuyVfk02rgi3GP+D2IYOq3Y5Y
         nWat42vnV5j/ce98A7nP9D7jnc3YfJAND+kAEqQ8Tht2ktbT7coWKQoxLBiwN267TZ6n
         dvGYIys2E26MJDrm6xZ/QDJjp4fPPJAZpt9pRr99eRJG2rktCOZCU3akejyiHKop5bhR
         qXQgTBfwZJFez/obyIONr9RF/6sCeIU8u2ROeeeFod23dC+0qYWRItJa1CSNHLPEQlWh
         zKjUk2UA8NRJK0U2hRU0Sv4cLmCwO4Iy4gnWBojq443Oc+dbq4utD1mr/xC3dJR2fMsx
         n5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPK40YWAf6BtjRqHVgLQZi1xemR6kOZPvN0zZwomqbeHo91Dvb7AEQ71jwsQXdsczadheh4aYeNyZmi+K3Vds+A/Pl15nAFl2F
X-Gm-Message-State: AOJu0YzXLslCbpqhndd/xX/1LzrD+0avCnIgChtPfAd+q+yVTff1zcBp
	czh+T7knkVKVUQIvpKEbEPyBbTxBaVwqcywewb18TkYdF5LmFFmov0+3+Nf7TFtTdSo26PnKS8x
	XAq9m/g==
X-Google-Smtp-Source: AGHT+IHuMHKc4F5eEF8DkkYQelT3hd1G8n+cvSa289PJ/U1JsySfexaC341ijHmfbSrptR41xaHWnQ==
X-Received: by 2002:a17:906:1cc5:b0:a3e:98ee:765d with SMTP id i5-20020a1709061cc500b00a3e98ee765dmr3902836ejh.60.1708451747153;
        Tue, 20 Feb 2024 09:55:47 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id s14-20020a17090699ce00b00a3f218aed03sm189199ejn.120.2024.02.20.09.55.46
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 09:55:47 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-563e6131140so5488461a12.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Feb 2024 09:55:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWqI77gnrx20yvV4/tQAMymVVpNR8KpSFBJDVh9ZAairHczUCTqvZMkGyM5KLRTtDysT5RJmdvV4Q5vdGPWu4YGR4PjJ0vTGHlh
X-Received: by 2002:aa7:d393:0:b0:564:3d68:55f5 with SMTP id
 x19-20020aa7d393000000b005643d6855f5mr5518556edq.5.1708451746591; Tue, 20 Feb
 2024 09:55:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130091300.2968534-1-tj@kernel.org> <20240130091300.2968534-6-tj@kernel.org>
 <bckroyio6l2nt54refuord4pm6mqylt3adx6z2bg6iczxkbnyk@bb5447rqahj5>
In-Reply-To: <bckroyio6l2nt54refuord4pm6mqylt3adx6z2bg6iczxkbnyk@bb5447rqahj5>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 20 Feb 2024 09:55:30 -0800
X-Gmail-Original-Message-ID: <CAHk-=whqae-+7Q7wbtnEj7YmR8vsx6skTj6j-srV2Fz7cBZ2ag@mail.gmail.com>
Message-ID: <CAHk-=whqae-+7Q7wbtnEj7YmR8vsx6skTj6j-srV2Fz7cBZ2ag@mail.gmail.com>
Subject: Re: [PATCH 5/8] usb: core: hcd: Convert from tasklet to BH workqueue
To: Tejun Heo <tj@kernel.org>, torvalds@linux-foundation.org, mpatocka@redhat.com, 
	linux-kernel@vger.kernel.org, dm-devel@lists.linux.dev, msnitzer@redhat.com, 
	ignat@cloudflare.com, damien.lemoal@wdc.com, bob.liu@oracle.com, 
	houtao1@huawei.com, peterz@infradead.org, mingo@kernel.org, 
	netdev@vger.kernel.org, allen.lkml@gmail.com, kernel-team@meta.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	linux-usb@vger.kernel.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Feb 2024 at 09:25, Davidlohr Bueso <dave@stgolabs.net> wrote:
>
> In the past this tasklet removal was held up by Mauro's device not properly
> streaming - hopefully this no longer the case. Cc'ing.
>
> https://lore.kernel.org/all/20180216170450.yl5owfphuvltstnt@breakpoint.cc/

Oh, lovely - an actual use-case where the old tasklet code has known
requirements.

Mauro - the BH workqueue should provide the same kind of latency as
the tasklets, and it would be good to validate early that yes, this
workqueue conversion works well in practice. Since you have an actual
real-life test-case, could you give it a try?

You can find the work in

   git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git
refs/heads/for-6.9-bh-conversions

although it's possible that Tejun has a newer version in some other
branch. Tejun - maybe point Mauro at something he can try out if you
have updated the conversion since?

                Linus

