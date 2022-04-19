Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208CA506F24
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 15:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352691AbiDSNs6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 09:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352739AbiDSNrB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 09:47:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 813053916A
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 06:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650375709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4adwg8hqyIITyJy5pTSFAx9A6BPYS26atLWx7A9LjPk=;
        b=W8FmYEJKTbsVNvJUGbynG8vQajDtErBP+z5fasSB365/8WMhcsYZkykLn73UKYWHxKcLgj
        KXGvPMiNBb/+9y3fUiDHEFIXDpfL43KF/Hw6+ScbZYSIXnAjaqNfsY97uL/X2qxUuk0IMA
        wf4X5qsdRe6NrrgdbYsO/zepyf6Dgi4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-qgKLJHwmMGqgAXxBu8PMVw-1; Tue, 19 Apr 2022 09:41:48 -0400
X-MC-Unique: qgKLJHwmMGqgAXxBu8PMVw-1
Received: by mail-wm1-f70.google.com with SMTP id d6-20020a05600c34c600b0039296a2ac7cso1250899wmq.1
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 06:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4adwg8hqyIITyJy5pTSFAx9A6BPYS26atLWx7A9LjPk=;
        b=Xy+n/0etwCJVpwj6zrHUeRp5fBM1vdELnIMvxxMyJJl+zWQ/3fzjJBDkxhLVnTnek3
         HjUbl/MAdznIbR2Jez+2otjRcy/PWsz9sOaQL/gkxCcEShTM6OQLJC0ZLe540mXYVM+l
         +FUS4vdU40lg1SBPq674mXOsqA33Jz9zaCaYTIPryVCmdGdMQymSDC/vCbmpBg7fc2wc
         R7dMdLxrF+ePzN/reN+JXeuPsqlnoHuW7+Bxww9Y0ebsQYFOeeiM1N1IWIU/s/xZijQL
         RmpqKJFtLIovpgQ9yT4W67deDpihdTQw78oBchFzhiLsgiNAqhxuBkvG8BfxlOoMmfvY
         aViw==
X-Gm-Message-State: AOAM530ZuCABr4y8wiZo1B17a9upbrjNTEe+rVTzja2L89yynSwm9g0n
        ouUPZ68Lj/8uoIo+cLYpEXtRtvlQDy7ULQVBRTd5h52nblRoxbWIDV10ZMGSCK8SaYa7TKONKzi
        0Pgcf5eTmDm9dpaXzSCWw
X-Received: by 2002:a05:600c:1c1f:b0:38e:c425:5b1a with SMTP id j31-20020a05600c1c1f00b0038ec4255b1amr16136734wms.69.1650375706945;
        Tue, 19 Apr 2022 06:41:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJvuZb+R54rr0s1wGva1v/Xk2FzPsygVQ3HcW3SsZOhzm7AK+wn4DeO9p0yN2bc4xhS4J72A==
X-Received: by 2002:a05:600c:1c1f:b0:38e:c425:5b1a with SMTP id j31-20020a05600c1c1f00b0038ec4255b1amr16136712wms.69.1650375706746;
        Tue, 19 Apr 2022 06:41:46 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-96-237.dyn.eolo.it. [146.241.96.237])
        by smtp.gmail.com with ESMTPSA id i27-20020a1c541b000000b003928e866d32sm9069716wmb.37.2022.04.19.06.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 06:41:46 -0700 (PDT)
Message-ID: <f6335341633b8af9bcbc1d410b2e6ae1b864c4e3.camel@redhat.com>
Subject: Re: [PATCH] net: ax88179: add proper error handling of usb read
 errors
From:   Paolo Abeni <pabeni@redhat.com>
To:     David Kahurani <k.kahurani@gmail.com>, netdev@vger.kernel.org
Cc:     syzbot+d3dbdf31fbe9d8f5f311@syzkaller.appspotmail.com,
        davem@davemloft.net, jgg@ziepe.ca, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        phil@philpotter.co.uk, syzkaller-bugs@googlegroups.com,
        arnd@arndb.de, dan.carpenter@oracle.com
Date:   Tue, 19 Apr 2022 15:41:45 +0200
In-Reply-To: <20220416074817.571160-1-k.kahurani@gmail.com>
References: <20220416074817.571160-1-k.kahurani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 2022-04-16 at 10:48 +0300, David Kahurani wrote:
> Reads that are lesser than the requested size lead to uninit-value bugs.
> In this particular case a variable which was supposed to be initialized
> after a read is left uninitialized after a partial read.
> 
> Qualify such reads as errors and handle them correctly and while at it
> convert the reader functions to return zero on success for easier error
> handling.
> 
> Fixes: e2ca90c276e1 ("ax88179_178a: ASIX AX88179_178A USB 3.0/2.0 to
> gigabit ethernet adapter driver")

In the next version, please additionally fix the above tag: it must use
a single line, even if that means exceeding the 72 chars length limit.

Thanks!

Paolo

