Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50D9A667143
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jan 2023 12:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjALLvG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Jan 2023 06:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbjALLuo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Jan 2023 06:50:44 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAB95E663
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 03:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673523546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qp7LxUOhP/zffa2I1gllxS81D7dtXmGujohyvT79haU=;
        b=T+HBN4cGaXSR/lWONp4yoxTgZuX9iLyyGQBf/7e7MRFaMxTtdDF/G+W6dPWvPRoFRADASL
        EfflA8jrRjtBKoYzWlv/eDegdUUOsQFXiuNTrea5QVBzuRiTlNB83lQ0EJT2tbwjud1j6K
        wf/HyVTdoNQSLMkNhwgJ1sld8gxIZhE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-cCzbrv_IM3-EzjqyLq7b3g-1; Thu, 12 Jan 2023 06:39:05 -0500
X-MC-Unique: cCzbrv_IM3-EzjqyLq7b3g-1
Received: by mail-wm1-f70.google.com with SMTP id n18-20020a05600c4f9200b003d993e08485so9168426wmq.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Jan 2023 03:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qp7LxUOhP/zffa2I1gllxS81D7dtXmGujohyvT79haU=;
        b=HsJDmGc/LTcCtNdIVDNdVVQZV4OUgWpyFyZtqiRr1UNkn5G3g7+EXLsdbgiI6sbuCH
         ckemsrq16t7TaChBjh/2y+gvNh9+Apr+i+6T8p/dY5gf5SmNFonswdiXbW0Xkk1qCVn8
         WkcFwBqyR23HNPvADYIU1QfWpe/Yq0hK3qNKgQfzCkC0VuIjPZIpC51gukLOlS5iup0Z
         4Fk/F+w5aTOFr3DB8mczAXwJJvbgFUPVvi0Qb6ny+9wgjZKp/hmf468yyAFVi0aOjXjx
         GBFIUpP9p5NXjogu5VXSvPYAB9DzeUL7r27bGfSmvMHA0/boB6Q15uDakr6kG/7rPJpP
         fpog==
X-Gm-Message-State: AFqh2kr5VDY064XNxx0k9KZN+GbkjBFW7GQ91udSow1dWZW1aCWPQ7ay
        GLzQvSule3YLLXVUwtFbzs56hCoxz/cCFOKxLU0SQNtphJnm62OlRxVBTz619gwo4Eh3jF4ILbM
        R0SguQxNesYpSrQ5uEtgh
X-Received: by 2002:a05:600c:2844:b0:3da:4e:8dfe with SMTP id r4-20020a05600c284400b003da004e8dfemr5984315wmb.38.1673523544125;
        Thu, 12 Jan 2023 03:39:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs5aW12cvHZEeONEsMIAQmSNDKTa6MrdMvBThl9kh/VmqT3fUCrb1IjlsK8Uei4YamC+1lCrw==
X-Received: by 2002:a05:600c:2844:b0:3da:4e:8dfe with SMTP id r4-20020a05600c284400b003da004e8dfemr5984299wmb.38.1673523543855;
        Thu, 12 Jan 2023 03:39:03 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-113-183.dyn.eolo.it. [146.241.113.183])
        by smtp.gmail.com with ESMTPSA id s7-20020a1cf207000000b003d98438a43asm20239891wmc.34.2023.01.12.03.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 03:39:03 -0800 (PST)
Message-ID: <4c48269962dafbb641d5b0c38ec5b7bf951f3b4d.camel@redhat.com>
Subject: Re: [PATCH net-next] r8152: add vendor/device ID pair for Microsoft
 Devkit
From:   Paolo Abeni <pabeni@redhat.com>
To:     Andre Przywara <andre.przywara@arm.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Date:   Thu, 12 Jan 2023 12:39:01 +0100
In-Reply-To: <20230112105137.7b09e70b@donnerap.cambridge.arm.com>
References: <20230111133228.190801-1-andre.przywara@arm.com>
         <20230111213143.71f2ad7e@kernel.org>
         <20230112105137.7b09e70b@donnerap.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2023-01-12 at 10:51 +0000, Andre Przywara wrote:
> On Wed, 11 Jan 2023 21:31:43 -0800 Jakub Kicinski <kuba@kernel.org> wrote:
> > Hm, we have a patch in net-next which reformats the entries:
> > ec51fbd1b8a2bca2948dede99c14ec63dc57ff6b
> > 
> > Would you like this ID to be also added in stable? We could just 
> > apply it to net, and deal with the conflict locally. But if you 
> > don't care about older kernels then better if you rebase.
> 
> Stable would be nice, but only to v6.1. I think I don't care
> about older kernels.
> So what about if I resend this one here, based on top of the reformat
> patch, with a:
> Cc: <stable@vger.kernel.org> # 6.1.x
> line in there, and then reply to the email that the automatic backport
> failed, with a tailored patch for v6.1?
> Alternatively I can send an explicit stable backport email once this one
> is merged.

Note that we can merge this kind of changes via the -net tree. No
repost will be needed. We can merge it as is on -net and you can follow
the option 2 from the stable kernel rules doc, with no repost nor
additional mangling for stable will be needed.

If you are ok with the above let me know.

Thanks,

Paolo

