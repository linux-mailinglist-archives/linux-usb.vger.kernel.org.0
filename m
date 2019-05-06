Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60B37148D6
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 13:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfEFLV3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 07:21:29 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36474 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbfEFLV3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 May 2019 07:21:29 -0400
Received: by mail-oi1-f194.google.com with SMTP id l203so9250152oia.3
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2019 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zJnP1e3PrSyPOKSQkKpaiKgq0s3Al006AQNyfZ0h9sI=;
        b=ne+u3aQOkXC+DiM+zwY/KjuCLvr/UWngTa5OKtrG+0wBoIZypQh6et2XswEjGFHaat
         EJAWuxXOzZm3CpMU8h/yznf2tCzpmbAVYlxIjQiMb2weuAvBOAZZDcIc119DRhWUIrBs
         8skWo/MHH9Pdn9usde2k33AkSLtDJ7QQD1THWiuVfWeY/udAjEBV9U3B5/je+9Sdp9Ue
         kIztrlw7bVMKYEntiZQlGyjKixpjIFAykNliG5bN9qmoRlN36vQNjKtEbUcF189ZdOGf
         htzCo4MYlGFzBBGFOHio1On/rPsSV/6vfjfha8yINBmTLqVHqKCIk+8LG+Tf5GOAz/UE
         UuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zJnP1e3PrSyPOKSQkKpaiKgq0s3Al006AQNyfZ0h9sI=;
        b=b6QXaupG259LorE8VcOUmCJ6McOfrl9CNdhDUmP0HAuytLshhVtPCHmxWDy8r5L0ob
         nk7xTgs/yCyAnoe7gSr2IP0Vq0gb/Sd2US0J0TFjeITv+Uuqhur0aosak3NSx2hf/UF4
         q8cvkB6DA1IeEL1r+GDHXHw+nX4aCTdsn35aYJJtqJ3sGQalQP85KQlD8qHJRdFsEmpC
         l3ovwJZ9ZXwzEmdXizEgplsLK8cyNXKKNdUQC02Z85bDoCS36VwKcXNQmcZ8TqVG93bR
         eKlvpzXYBPPejKe+XXCVgDHv2CD/lhl4FHxp7ZgdICrc4YIU8ub5/hnHt7uznUdnRYU1
         YkLQ==
X-Gm-Message-State: APjAAAUfZQaoHwkb4/wbJa8ysQ/EoeU5ny20uvEY9tZ6iOrvwXBoF26A
        uVRyxop/tfov8eOhtC14ws8bYLKSxPH1cMj3oWz8ax8g
X-Google-Smtp-Source: APXvYqwsqkpWqUDH24Qzzf3jp25IoaovfUKnRgA0Hy2i0iyxMQrQMj8wI9BuPcwALPLIlwr1yufkZgB8RdfnwtiEvmg=
X-Received: by 2002:aca:1a16:: with SMTP id a22mr195010oia.174.1557141688578;
 Mon, 06 May 2019 04:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190506090241.169665-1-grawity@gmail.com> <20190506090241.169665-6-grawity@gmail.com>
 <20190506111257.GA20756@kroah.com>
In-Reply-To: <20190506111257.GA20756@kroah.com>
From:   =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Date:   Mon, 6 May 2019 14:21:17 +0300
Message-ID: <CAPWNY8WCOdx4CjiSM2W+EN5DSLuFKNxj=4fncRGZUoadem_0_w@mail.gmail.com>
Subject: Re: [PATCH 05/34] lsusb.py: remove -w (warn if usb.ids not sorted) option
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 6, 2019 at 2:13 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, May 06, 2019 at 12:02:12PM +0300, Mantas Mikul=C4=97nas wrote:
> > Signed-off-by: Mantas Mikul=C4=97nas <grawity@gmail.com>
> > ---
> >  lsusb.py.in | 45 ++-------------------------------------------
> >  1 file changed, 2 insertions(+), 43 deletions(-)
>
> Why remove this?  What's wrong with this option for people who want to
> work on usb.ids?


Hmm, I was under the impression that its purpose was just for
debugging the lookup code and becomes unnecessary when said lookup
code is outright removed (the next commit removes the binary-search
lookup). Did I misunderstand the code?

(Although in any case, a dedicated "lint-usb.ids" script seems like a
more fitting place for this feature than a lsusb option...)

--=20
Mantas Mikul=C4=97nas
