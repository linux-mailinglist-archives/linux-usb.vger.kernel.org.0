Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D0C71624F
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 15:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbjE3Nl7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 09:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjE3Nl6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 09:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBEE5C5
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685454069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n0CkyHEtcTifnOXVB8Vspl4eg4a6Ka45BNcOmHqGA8I=;
        b=DXDhZQgOZ30dsmu57lWpRlBT2tAldgsxGaNjuBUGyKs93cTFRC6Ubvk0C3HyayivaqoerI
        KOuJi2ECQ3WO9hIDT2XSyQ9Fhyi7vJXujURo7tea+cfeM39ZX2aFikxAeoEdPZVsGwcRDc
        dT2JlnbrD+u2S06cRNBdj3ltut+B4qs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-NQHYPzHIPXGpTB90JEdCaQ-1; Tue, 30 May 2023 09:41:08 -0400
X-MC-Unique: NQHYPzHIPXGpTB90JEdCaQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-75c9b116dddso8815585a.0
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 06:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685454068; x=1688046068;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0CkyHEtcTifnOXVB8Vspl4eg4a6Ka45BNcOmHqGA8I=;
        b=JSDV6AfAkzkK4vUf0Vl/Ccz4Ar7oMPeMpagLtdcNgBiC7ikTp+DUFGX2xuMsxDK2//
         NNijGxXoSmlE1zYLHmLuqd0S7JvDa48jz1MSm4E4E7DfBxfMlZJX2UdREPOhn8DtPHoa
         6yywJNJIlloR8fVDVntbd/6FyHJSX3ci50X+kxL8pcIGQ9QiDhFvFB1rwBNNoCzbIVfI
         HZG5MBzd+Hco42Yl7uIPwBAgz7CSQ+1OiXtDac3yiWj8k5Qubv/Y0jilv2NivhjmCC9Z
         4pavxb8JJZErcqBwhiTfM80z9Kkxe4XcUJV2GPdKFbhzZiMCUCqKO5cSTkspoHt2+gWC
         3xbQ==
X-Gm-Message-State: AC+VfDxCnjBQMDvb0SAH509kM1M6DA9jSjO6EFWiEoxz7Ph0f5kqfTy7
        LDgQQtTJuvl/t2HvGbshCFUDCkOY8/TN129vwGYqrEQ0HMVyM9+UJ/0I/Cj+/dWrkF4+ygbUGUY
        2/dFBWgddv8i8ep9cO1JU
X-Received: by 2002:a05:620a:2694:b0:75b:23a1:82a2 with SMTP id c20-20020a05620a269400b0075b23a182a2mr2019255qkp.3.1685454067873;
        Tue, 30 May 2023 06:41:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7j/oCMBGzRbpvd7/AXnahFFwjHyAEk12eU0pbhaky5dA8obmwDB2JJodeXY7f1zLQga2djRg==
X-Received: by 2002:a05:620a:2694:b0:75b:23a1:82a2 with SMTP id c20-20020a05620a269400b0075b23a182a2mr2019242qkp.3.1685454067613;
        Tue, 30 May 2023 06:41:07 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-248-97.dyn.eolo.it. [146.241.248.97])
        by smtp.gmail.com with ESMTPSA id p2-20020a05621415c200b0061b58b07130sm1355409qvz.137.2023.05.30.06.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 06:41:07 -0700 (PDT)
Message-ID: <a75954b2fd1aeccb2a6898dc9d10f7e46f611788.camel@redhat.com>
Subject: Re: [PATCH net-next v3 1/2] usbnet: ipheth: fix risk of NULL
 pointer deallocation
From:   Paolo Abeni <pabeni@redhat.com>
To:     George Valkov <gvalkov@gmail.com>, Foster Snowhill <forst@pen.gy>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Simon Horman <simon.horman@corigine.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Linux Netdev List <netdev@vger.kernel.org>
Date:   Tue, 30 May 2023 15:41:04 +0200
In-Reply-To: <A4F3E461-E5BE-4707-B63A-BD6AAC3DBD02@gmail.com>
References: <20230527130309.34090-1-forst@pen.gy>
         <0f7a8b0c149daa49c34a817cc24d1d58acedb9f4.camel@redhat.com>
         <A4F3E461-E5BE-4707-B63A-BD6AAC3DBD02@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2023-05-30 at 14:11 +0300, George Valkov wrote:
> Sorry, I attached the old version by mistake. Here is the new version:

LGTM.

Please in future prefer inline patch vs attachments even for
discussion.

Note that you will have to formally repost both patches.

Thanks!

Paolo

