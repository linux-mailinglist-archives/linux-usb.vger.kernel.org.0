Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4132435713
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 08:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfFEGgf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 02:36:35 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43701 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbfFEGgf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 02:36:35 -0400
Received: by mail-pg1-f195.google.com with SMTP id f25so11830167pgv.10
        for <linux-usb@vger.kernel.org>; Tue, 04 Jun 2019 23:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cLlFZ2o0LpTwp/fKkQ8TzEzBhbfXX9wyZ8InMPyT3TE=;
        b=meWtcflI9lbKNTuGFkydTCJnimmZnhaj6CRLwLm669zmDMm3kCwcCloMSiHrrzjSvJ
         XL1tC5GioHTjpDHe1eyFwhNpHMWuHZu1rcXMI+9sjXjnb6+lqQ+ZyguoVIDvMerS1qym
         aBr0cYHprSrRsd57tjGkJvvNJlLo1lvRqCx+1UgEpcS2N+Kgi09chEg9LPE6006+c75K
         MPU8lZwey6zdGHmbYX62Vz4MN2fxTYRnfDz1EvWFh8CBqH6UtrknoyB4KEhTftZImi0k
         gVilxUGQn77rPRZFDZiWisDv1Cbyo4dBkihuJgnuoUTIO9gJAIqkyguLkI2qthOG8Rhw
         cC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cLlFZ2o0LpTwp/fKkQ8TzEzBhbfXX9wyZ8InMPyT3TE=;
        b=eYfT2uzY4z4iM9n3ByWIICAl3W4DJHCDemunP3ZUMFUvQ6VaJ66lIuRPu0ST9mkVOe
         DTqT9xVHppEMcFgBILZSNTYMLnWvJfyY/wwdzSeqQYyV8q3Qw03zCt0gsWJwsdhwz3Ll
         RQ/cKjruzalTX3CMmWdYopG7w86yBk48X3kwcBsylYLQKGWuJmLn1Zo6glTnsDdanMkV
         pNw79o1EJdXkmb5HQFgKG3PdIiOft2LvmPe5GObMRSlBMiSVKLkqfomPNgmWWE3ImNQX
         /nf+4AGJOGjUAxlcJEU2IqlAHs6PIUV8YP0X671HbJVCUH9cQoGsUmGiDgejTFwwQwVi
         dssw==
X-Gm-Message-State: APjAAAWueHICcjng2mhJqRiKvGqWoUjcyyYwqLeaBATtK2ZKb5TSPJHs
        oK22kwh2CGcRrag8bQbUiShemM9UPHkhq0YZ3vZa8ApwEYI=
X-Google-Smtp-Source: APXvYqyfR48UZuvmN9JDhvYiHxHtlTJYdjodqYmO6SlF9UM9MtVtr2EtT8CiCycFC0qmeA787T+wkEbo0JQoibgs6bg=
X-Received: by 2002:a63:db4e:: with SMTP id x14mr2376554pgi.119.1559716594264;
 Tue, 04 Jun 2019 23:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190603131258.GA10397@kroah.com> <CAB31r6VK12FXoPh6eNfE1v_Tgjv917Nh7699=TZpm4SkCVMm-w@mail.gmail.com>
 <20190604054045.GD1588@kroah.com>
In-Reply-To: <20190604054045.GD1588@kroah.com>
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Wed, 5 Jun 2019 16:36:23 +1000
Message-ID: <CAB31r6WAkDPKyvY31Up=OAGXvhQgS23uW5YYQs601zUaaNaELg@mail.gmail.com>
Subject: Re: kernel NULL pointer dereference, ucsi bug
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Good day Mr. Kroah-Hartman,

I've found the culprit commit. It took a while though but now I'm sure:

commit - brief decription - time - works (y) or not (n)
670784fb4ebe54434e263837390e358405031d9e - rc1 2019-05-20
e260ad01f0aa9e96b5386d5cd7184afd949dc457 - rc0 2019-05-14 19:52:51 -0700 n
8ea5b2abd07e2280a332bd9c1a7f4dd15b9b6c13 - rc0 2019-05-09 19:35:41 -0700 n
54516da1ea859dd4f56ebba2e483d2df9d7c8a32 - rc0 2019-05-05 21:58:36 -0700 y
71ae5fc87c34ecbdca293c2a5c563d6be2576558 - rc0 2019-05-06 20:29:45 -0700 y
80f232121b69cc69a31ccb2b38c1665d770b0710 - rc0 2019-05-07 22:03:58 -0700 y
a2d635decbfa9c1e4ae15cb05b68b2559f7f827c - rc0 2019-05-08 21:35:19 -0700 n
132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a - rc0 2019-05-08 10:03:52 -0700 n
86dc59e39031fb0d366d5b1f92db015b24bef70b - rc0 2019-05-08 09:46:44 -0700 y

So 86dc59e39031fb0d366d5b1f92db015b24bef70b is the last working for
me, and 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a is the breaking one:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv5.2-rc3&id=3D132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a


=D0=B2=D1=82, 4 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 15:40, Greg KH <gre=
gkh@linuxfoundation.org>:
>
> On Tue, Jun 04, 2019 at 12:58:38AM +1000, Vladimir Yerilov wrote:
> > No, I can't.
> >
> > Unfortunately, this exceeds the scope of my knowledge. I simply don't
> > know enough to understand your request correctly. What I can is to
> > compile and try some pre-rc1 5.2 kernel and see how it goes. Also I
> > managed to trace the source of this problem more precisely.
>
> If you can use a pre-rc1 5.2 kernel, that means you are using git, so
> just look at 'git bisect --help' for how that command works and how you
> can use it to find the exact problem commit.
>
> thanks,
>
> greg k-h



--=20
----
Best regards,
Vladimir Yerilov
