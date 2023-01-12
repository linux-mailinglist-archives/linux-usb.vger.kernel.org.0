Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E97C6672EE
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jan 2023 14:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233212AbjALNJr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Jan 2023 08:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbjALNJp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Jan 2023 08:09:45 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDF451327
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 05:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673528939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nCRS/MpkyPeaVrlVLdkBcx6JcO4jj78Pqfq4rjjeatI=;
        b=IQFzgWZcAcwq2Tc26la4O74oKVvqRJ3LBMVdaNaPmphmdqQj5Cx8jIFYDE2jaZK8c0RNYa
        urQG0t3h1Us+QJYckuohwM2e5I7Bv7yLZmUy4Cr+xyfpETRz8jUFB0vU8JOOY7VYilv4zc
        rLzr7CZ/RjxoQ2alFSQqJW9LpHruQy0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-Tq7krN0INhKG_iihZODjVQ-1; Thu, 12 Jan 2023 08:08:58 -0500
X-MC-Unique: Tq7krN0INhKG_iihZODjVQ-1
Received: by mail-yb1-f198.google.com with SMTP id l194-20020a2525cb000000b007b411fbdc13so19552025ybl.23
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 05:08:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCRS/MpkyPeaVrlVLdkBcx6JcO4jj78Pqfq4rjjeatI=;
        b=cjFuVi62sUXr3LrTRJSV/7lC8XTrjt5uPf8wN6dNKHheMhDla5QGJIdw0e0VvV3wtB
         dIc4yR0GbuG5UEKv8f127of35L5Zn38I4KoLlep+MXwGQm/Um2HZYRRhfOZmdIZFukpw
         Vabi+oDd4leh5qJ4btw/eXT1UM12CTlu29YBir2XiRODq2nBdRxrbiGSYWAviuj9Pjls
         dDi8nZzF9uzgxEvZeHdnQhrp4//rEzVYyjf+Gu7OAO3XD1394iyPEpshw5rY5YWZl9Gj
         JlEiDgBI6X2nxoO2YGWsecF1Z3mQL7vw2eBQigplf11bnYraqHt8Z6tBfGFP+9cRMlVI
         e5jg==
X-Gm-Message-State: AFqh2kqNzvqT762vO64Ew2ox5nKeA3AWG0TVRSdFgX5UwCY4qrUrQplg
        Um7jBU70A49AHIWsbnNT5rX79B83g2efHACY20lYF6HOouL0VBWeJ7ncTrs4WPg+M4znJpaMHUx
        g2dmzjjeBSPSHkl9BxuDy
X-Received: by 2002:a05:7500:16cc:b0:f0:4692:cc0 with SMTP id ce12-20020a05750016cc00b000f046920cc0mr1298090gab.28.1673528937051;
        Thu, 12 Jan 2023 05:08:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtVkkADuVZjTJe4BA/F7Hbb10OyHI3PlW0oPb18BdiV3GHvC5tzK1mPBMMc0FP3iW/BXGLyqQ==
X-Received: by 2002:a05:7500:16cc:b0:f0:4692:cc0 with SMTP id ce12-20020a05750016cc00b000f046920cc0mr1298060gab.28.1673528936660;
        Thu, 12 Jan 2023 05:08:56 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-113-183.dyn.eolo.it. [146.241.113.183])
        by smtp.gmail.com with ESMTPSA id j9-20020a05620a288900b006f9f714cb6asm10549640qkp.50.2023.01.12.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 05:08:56 -0800 (PST)
Message-ID: <bd39d0ffec879ccff7bff79f9ff16a727a3f8301.camel@redhat.com>
Subject: Re: [PATCH net-next] r8152: add vendor/device ID pair for Microsoft
 Devkit
From:   Paolo Abeni <pabeni@redhat.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Date:   Thu, 12 Jan 2023 14:08:53 +0100
In-Reply-To: <20230112115659.27fb453d@donnerap.cambridge.arm.com>
References: <20230111133228.190801-1-andre.przywara@arm.com>
         <20230111213143.71f2ad7e@kernel.org>
         <20230112105137.7b09e70b@donnerap.cambridge.arm.com>
         <4c48269962dafbb641d5b0c38ec5b7bf951f3b4d.camel@redhat.com>
         <20230112115659.27fb453d@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2023-01-12 at 11:56 +0000, Andre Przywara wrote:
> On Thu, 12 Jan 2023 12:39:01 +0100
> Paolo Abeni <pabeni@redhat.com> wrote:
> 
> Hi,
> 
> > On Thu, 2023-01-12 at 10:51 +0000, Andre Przywara wrote:
> > > On Wed, 11 Jan 2023 21:31:43 -0800 Jakub Kicinski <kuba@kernel.org> wrote:  
> > > > Hm, we have a patch in net-next which reformats the entries:
> > > > ec51fbd1b8a2bca2948dede99c14ec63dc57ff6b
> > > > 
> > > > Would you like this ID to be also added in stable? We could just 
> > > > apply it to net, and deal with the conflict locally. But if you 
> > > > don't care about older kernels then better if you rebase.  
> > > 
> > > Stable would be nice, but only to v6.1. I think I don't care
> > > about older kernels.
> > > So what about if I resend this one here, based on top of the reformat
> > > patch, with a:
> > > Cc: <stable@vger.kernel.org> # 6.1.x
> > > line in there, and then reply to the email that the automatic backport
> > > failed, with a tailored patch for v6.1?
> > > Alternatively I can send an explicit stable backport email once this one
> > > is merged.  
> > 
> > Note that we can merge this kind of changes via the -net tree. No
> > repost will be needed. We can merge it as is on -net and you can follow
> > the option 2 from the stable kernel rules doc, with no repost nor
> > additional mangling for stable will be needed.
> > 
> > If you are ok with the above let me know.
> 
> That sounds good to me, but that will then trigger a merge conflict when
> net-next (with the reformat patch) is merged? I guess it's easy enough to
> solve, but that would be extra work on your side. If you are fine with
> that, it's OK for me.

Fine by us (well, probably poor Jakub will end-up handling the
conflict, but AFAIK he is ok with this specific case).

I'll merge the patch on net.

Cheers,

Paolo

