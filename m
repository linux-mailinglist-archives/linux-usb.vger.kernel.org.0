Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A96715C81
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 13:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbjE3LDb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 07:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjE3LDa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 07:03:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F1FBB0
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685444564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dSzk8Yi5vP8hlY2CK6/rG6duz8saPW0zYZYVLxPb0K8=;
        b=VTCiA28w4YPQHEKfuiDxx+ZgmKbDwAx/hiJaLfmrEcQRIpZz+SBc9JRx6oVRHIiYiWxLBS
        xouQ9QR59vOcsEU2bcahNyu+kg3IabUpy9riAdRYTEDM/JgC87bhfRD8yT2bpLJjIisG5o
        7lmg6hbs4h3idU7H0a3JD/oD64rlVz4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-6nqHwXVgPbC2L4V6JOgwKw-1; Tue, 30 May 2023 07:02:43 -0400
X-MC-Unique: 6nqHwXVgPbC2L4V6JOgwKw-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-64d614d3674so903107b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 04:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685444562; x=1688036562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dSzk8Yi5vP8hlY2CK6/rG6duz8saPW0zYZYVLxPb0K8=;
        b=WYZfdsZEsNKHznwAznF3oCSwBvOyDnWqxdI6oo1j4dhIIt3PlydLdLGA9MhONq7nyU
         NDL9/RtkCcgfpvefJKxkx0kczzbgN1jRWJ9KEnW10DAdPohHnNEkivFQ7PtzPt78tGMm
         Da0CkcFyh9FuqdiIkV7F6p6WqJ2uSJ/k+aTPddF1c2rF7sAjB7snLhS+emLxF8QRM0ix
         DVNHGndhyuU15zYBF4Pzurh//CV4Q7KzWamVtC9fAbUQzKJQT6eSg3+Ptq5v1bZkN+Lh
         KEvwfpUS1u0yHDK4iH+Px32z23IOD2GOUCh5NS9dNsVawt6DnwF+pTEKW0h4gW2D/dWD
         qyjw==
X-Gm-Message-State: AC+VfDyXINbFp8O2/b3pk8iET/MkTWY2ESky3Jbr9cVjfTV38Ak0E3w2
        7UzCCFRAyI2U9tNvha/4dHujsPDv+bEhqj9CLD9COlRWGnVapt/f+T4HcruZbtsnC4kdRtYta+2
        b5bSE+hFIHrzQabiNWm/M
X-Received: by 2002:a05:6a00:2e12:b0:643:9bc3:422a with SMTP id fc18-20020a056a002e1200b006439bc3422amr1637045pfb.3.1685444562215;
        Tue, 30 May 2023 04:02:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/wLRPw7JOC5bPdXKbq0a8bjrBR7lJ5iXuRDjL3OKqL5l6HeuOZyQpXD+m4y7K36bLzx2U4A==
X-Received: by 2002:a05:6a00:2e12:b0:643:9bc3:422a with SMTP id fc18-20020a056a002e1200b006439bc3422amr1637028pfb.3.1685444561854;
        Tue, 30 May 2023 04:02:41 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-248-97.dyn.eolo.it. [146.241.248.97])
        by smtp.gmail.com with ESMTPSA id b15-20020aa7810f000000b0064ceb16a1a2sm1364941pfi.182.2023.05.30.04.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 04:02:41 -0700 (PDT)
Message-ID: <0f7a8b0c149daa49c34a817cc24d1d58acedb9f4.camel@redhat.com>
Subject: Re: [PATCH net-next v3 1/2] usbnet: ipheth: fix risk of NULL
 pointer deallocation
From:   Paolo Abeni <pabeni@redhat.com>
To:     Foster Snowhill <forst@pen.gy>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Georgi Valkov <gvalkov@gmail.com>,
        Simon Horman <simon.horman@corigine.com>,
        Jan Kiszka <jan.kiszka@siemens.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Date:   Tue, 30 May 2023 13:02:37 +0200
In-Reply-To: <20230527130309.34090-1-forst@pen.gy>
References: <20230527130309.34090-1-forst@pen.gy>
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

Hi,=20

On Sat, 2023-05-27 at 15:03 +0200, Foster Snowhill wrote:
> From: Georgi Valkov <gvalkov@gmail.com>
>=20
> The cleanup precedure in ipheth_probe will attempt to free a
> NULL pointer in dev->ctrl_buf if the memory allocation for
> this buffer is not successful. While kfree ignores NULL pointers,
> and the existing code is safe, it is a better design to rearrange
> the goto labels and avoid this.
>=20
> Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
> Signed-off-by: Foster Snowhill <forst@pen.gy>

If you are going to repost (due to changes in patch 2) please update
this patch subj, too. Currently is a bit confusing, something alike
"cleanup the initialization error path" would be more clear.

Thanks,

Paolo

