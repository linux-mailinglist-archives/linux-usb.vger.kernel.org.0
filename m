Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90604AAB83
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 20:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390516AbfIESvx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 14:51:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60285 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731779AbfIESvx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Sep 2019 14:51:53 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B6156C055673
        for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2019 18:51:52 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id o11so1383514wrq.22
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2019 11:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+X/R0y41DuJD8stDaaFF/mk4jlVxfRDTjRBOtakznc=;
        b=j6FiBgyuUzqUpWsColjtzifNWnuJD2Cr+eMGNII6hinMVwGX3ojNDnAaHn187sRcvk
         BdjFpuMjhZmDeQAcqcAOWNk14m9fHIidS8zmratM4N6AWDxioVse7zhaCKPWXrdn4IEO
         BbIS6pIecqmsN9hCumKv6Y2OeTaefQkXYPZA+wl6Dqz03W58U7+K6JNap27g0AuvnGSm
         xTI2Vth6E9WI6lQmaMeVePoxogLM1aassc7ch1rRGEkBnJ6RBXiJc7QuMctOUxr71gTI
         3eb44SieAOlQ8WUuKYsambyFM5xJwmBeVzyW+Ci8ypGzhhoAwqiiqXzoB1qFkCW+U3TI
         cEbw==
X-Gm-Message-State: APjAAAV++phGz33HV78BO5JX9Lulph944Pwtd0Fw/IJWCeVsKAgC+Nuc
        OShf7/+mWi5/gnewF09k33Fli9O3gGjpWMlaivi03glxhHZUb18z+t6RBUP5FCOOz313Tg/Nz2d
        WN5v/brbmkN4Ol/tKosCi6FvoX1JxEPN8LrUV
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr3763570wmj.123.1567709511265;
        Thu, 05 Sep 2019 11:51:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxppOJbXRzr0HT1qBIm7hjC+zxuRCss37FvJwDjsHuKSxoe+byuVe16izziNYRTPD8dFxdzcLlPcTR/VI7zzA=
X-Received: by 2002:a05:600c:21d1:: with SMTP id x17mr3763540wmj.123.1567709510985;
 Thu, 05 Sep 2019 11:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <156763534546.18676.3530557439501101639.stgit@warthog.procyon.org.uk>
 <CAHk-=wh5ZNE9pBwrnr5MX3iqkUP4nspz17rtozrSxs5-OGygNw@mail.gmail.com>
 <17703.1567702907@warthog.procyon.org.uk> <CAHk-=wjQ5Fpv0D7rxX0W=obx9xoOAxJ_Cr+pGCYOAi2S9FiCNg@mail.gmail.com>
 <11667f69-fbb5-28d2-3c31-7f865f2b93e5@redhat.com>
In-Reply-To: <11667f69-fbb5-28d2-3c31-7f865f2b93e5@redhat.com>
From:   Ray Strode <rstrode@redhat.com>
Date:   Thu, 5 Sep 2019 14:51:14 -0400
Message-ID: <CAKCoTu7ms4ckwDA_-onuJg+famnMzGZE9gGUcqqMz0kCAAECRg@mail.gmail.com>
Subject: Re: Why add the general notification queue and its sources
To:     Steven Whitehouse <swhiteho@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Christian Brauner <christian@brauner.io>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        David Lehman <dlehman@redhat.com>, Ian Kent <ikent@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Sep 5, 2019 at 2:37 PM Steven Whitehouse <swhiteho@redhat.com> wrote:
> The original reason for the mount notification mechanism was so that we
> are able to provide information to GUIs and similar filesystem and
> storage management tools, matching the state of the filesystem with the
> state of the underlying devices. This is part of a larger project
> entitled "Project Springfield" to try and provide better management
> tools for storage and filesystems. I've copied David Lehman in, since he
> can provide a wider view on this topic.
So one problem that I've heard discussed before is what happens in a thinp
setup when the disk space is overallocated and gets used up. IIRC, the
volumes just sort of eat themselves?

Getting proper notification of looming catastrophic failure to the
workstation user
before it's too late would be useful, indeed.

I don't know if this new mechanism dhowells has development can help with that,
and/or if solving that problem is part of the Project Springfield
initiative or not. Do you
know off hand?

--Ray
