Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA3326392F
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 00:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbgIIWgr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 18:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729741AbgIIWgK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Sep 2020 18:36:10 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC2BC0617A0
        for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2020 15:36:05 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id n133so4083955qkn.11
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2020 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=c134n78aG+T1D05fG/7gwyDy+RohECK5LAEVlOiODCw=;
        b=NyzBsT+JUu0U0kwfTlzpDClheXiWwFCChT8B3B3AnRObKvk4drNujFjFruGeHjyE5E
         J/ekKdFGX4ZPNWUfEPhKExoK0sWWjXwST+pbBqDSQQLO3bhHO97u7XE9KwITCllyZTNP
         KD49/yc1MfvhSPgbWZUU1AxUsv6U0vCFkivBcLxiu3ppVdmJeK1Itxs2CD5ayafEhare
         Y4u34snA9MTl4Likr5RS+E4LR0hKde+fx41J4h2BvlUn7go15Yxb6eLzvLXVka4Mre/N
         zumvX8Blxljzlanq14R9XGa7dbkpGn90Uvx/RhT36f5UMVOZXDvQeH4wAZB+Eu6xRGBh
         woew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c134n78aG+T1D05fG/7gwyDy+RohECK5LAEVlOiODCw=;
        b=aSiM5+OFDrGchSE3JSOME+7XNP+H83L449b4aj6yO2aPyQzifPycQMvfkr8ycnqZjQ
         UyCS8A0lnxpOKrWPb98GZpn7yypcp1nvlrnTAKGv3IeKGdWVEXK7na5kBxFtvdUr0NVI
         r+E8mPE+KtymCiUKsN/Pr+qqqpvpJTp556a5GP8qDl9H2t1qpIFea5/dbjWes9CaoFfk
         Eqlt6mC5EoLJjJMGGBRde25mIx/aiSE3digL4LdF6TahQM4qEr7XqiIyqchPXwGcS29C
         gNUrkyZ5ZDcm9Qy/IOrkYOrJeMhkMGYdUPWGeBWjDwylCjblh1j8cIKpPPdMRQisldMn
         fNxw==
X-Gm-Message-State: AOAM53334IKY+S5vW8hxcAn6McfYcgU4vj0ujmMC1Pfunw2u4D5lti2m
        6COgv84UoFgoE4U9x/1S2afooQ==
X-Google-Smtp-Source: ABdhPJx7fgh7UgPdTXT6uFy6snoRxxciP2Hd+WS8NFMVek051RlvF5/SRN4VKGquIHZA++zqp1uC0Q==
X-Received: by 2002:a05:620a:2225:: with SMTP id n5mr5229154qkh.171.1599690963887;
        Wed, 09 Sep 2020 15:36:03 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id g5sm4497430qtx.43.2020.09.09.15.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:36:03 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kG8h8-004BIN-8t; Wed, 09 Sep 2020 19:36:02 -0300
Date:   Wed, 9 Sep 2020 19:36:02 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joe Perches <joe@perches.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Kees Cook <kees.cook@canonical.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-mips@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        nouveau@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-rdma@vger.kernel.org,
        iommu@lists.linux-foundation.org, dm-devel@redhat.com,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-mtd@lists.infradead.org, intel-wired-lan@lists.osuosl.org,
        oss-drivers@netronome.com, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-nvme@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-scsi@vger.kernel.org,
        storagedev@microchip.com, sparclinux@vger.kernel.org,
        linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-parisc@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-afs@lists.infradead.org, ceph-devel@vger.kernel.org,
        linux-nfs@vger.kernel.org, bpf@vger.kernel.org,
        dccp@vger.kernel.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, linux-sctp@vger.kernel.org,
        alsa-devel <alsa-devel@alsa-project.org>
Subject: Re: [trivial PATCH] treewide: Convert switch/case fallthrough; to
 break;
Message-ID: <20200909223602.GJ87483@ziepe.ca>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 09, 2020 at 01:06:39PM -0700, Joe Perches wrote:
> fallthrough to a separate case/default label break; isn't very readable.
> 
> Convert pseudo-keyword fallthrough; statements to a simple break; when
> the next label is case or default and the only statement in the next
> label block is break;
> 
> Found using:
> 
> $ grep-2.5.4 -rP --include=*.[ch] -n "fallthrough;(\s*(case\s+\w+|default)\s*:\s*){1,7}break;" *
> 
> Miscellanea:
> 
> o Move or coalesce a couple label blocks above a default: block.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> 
> Compiled allyesconfig x86-64 only.
> A few files for other arches were not compiled.

IB part looks OK, I prefer it like this

You could do the same for continue as well, I saw a few of those..

Thanks,
Jason
