Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36BA5527D22
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 07:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239883AbiEPFpd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 01:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239892AbiEPFpc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 01:45:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5125C1055E
        for <linux-usb@vger.kernel.org>; Sun, 15 May 2022 22:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652679930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PbHBwtWG6KCcH6kfap+X/3LjIb+3C13uUejN0vnS9ZY=;
        b=QeW14LVJp/SFV0S+9EOFw28mgOlBBpWrXhTQtQyP52ELQZl2rTISwO1s8fVqMrRYPhtyqQ
        m50gTHjm74Ejw5YhJXrZWyHkLQYruOJchXTKsOyketzfIPwDZxm1gG7bbT/cwJvSKGSbPi
        F3lqTGJzk1J9ivmIQi88xQfxKY6Hlo0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-46OkVINkN_OZdG254G6psQ-1; Mon, 16 May 2022 01:45:28 -0400
X-MC-Unique: 46OkVINkN_OZdG254G6psQ-1
Received: by mail-qk1-f198.google.com with SMTP id 124-20020a370982000000b006a0a716249bso10577050qkj.10
        for <linux-usb@vger.kernel.org>; Sun, 15 May 2022 22:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PbHBwtWG6KCcH6kfap+X/3LjIb+3C13uUejN0vnS9ZY=;
        b=o2QwtZ7zWno6qLKMRYS3scJV/vYqqblrv9XiGUyRhyOpMXEGS7xPmgoNejY8FCe9JR
         WrDb8R2a7qOtVNgB2nNwx9NIdBfYiy9wZV7bBSOsjScz6KpxRLdg3uaQMAYxBC2h85sJ
         8kFYzkxs4FH/YQnkWTOa40OubHpx0fQw+a90brpKfMUByFcp8DZKwlFy5CyrNl4wUUXz
         G1vZJloxuO3ZX+MyfIb/fE12UJrMSjUaVE5YSkvRcftotv29d7wY2waP0Hol42NkdazV
         FM9jhHfXY/KmQQeFA45gOdanGtOM4gfKNTr6HDrA5+OsX8NGb49L77+AbiOPg1KWHBqX
         bIcA==
X-Gm-Message-State: AOAM533g18oecr8HsJFC5dFwtyirjK/bH8RtadccpeZLaO29SSLLlMib
        lzMmjn/GK68uqMT7lBKyyTzp4O7oHrKqtT/z5l/r7uRu3jYrug6ZbVTjKOEg4iaKaZebsDEU/kQ
        h5D03y1sz8/bDITptv+fS4wA2CjSTMx92zRls
X-Received: by 2002:a05:622a:351:b0:2f3:d8e4:529f with SMTP id r17-20020a05622a035100b002f3d8e4529fmr14135653qtw.123.1652679927923;
        Sun, 15 May 2022 22:45:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpCUv4pnrOBS9JkzzIB0Du6/4EJhDQb/1uX60y+Po+fXEkJp0vHsyXcs/iskKm/YtlahvnzRGuLDEK2nPvS00=
X-Received: by 2002:a05:622a:351:b0:2f3:d8e4:529f with SMTP id
 r17-20020a05622a035100b002f3d8e4529fmr14135646qtw.123.1652679927718; Sun, 15
 May 2022 22:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220504151647.471885-1-jtornosm@redhat.com> <Ynzz6Jh5OeEikvfh@kroah.com>
 <CABk-BGte9qHwmdqCU6oZ9-E3LvOqcMf3z46e00hypNdD_hPxPQ@mail.gmail.com>
 <Yn5mliJq+7W8khe9@rowland.harvard.edu> <Yn5nc2mSHrdy/8h6@kroah.com>
 <Yn5qerFAcHP3scAZ@rowland.harvard.edu> <87zgjl8okv.fsf@miraculix.mork.no>
In-Reply-To: <87zgjl8okv.fsf@miraculix.mork.no>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Mon, 16 May 2022 07:45:16 +0200
Message-ID: <CABk-BGszGzn-ZCKMTmr9uJd2zxhdB6WtZ8AoNd5dLjhzQew2xg@mail.gmail.com>
Subject: Re: [PATCH v5] USB: core: skip unconfiguration if device doesn't
 support it
To:     =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have just tested usbreset program (without my previous patch):

$ hciconfig
hci0:    Type: Primary  Bus: USB
    BD Address: 00:1A:7D:DA:71:13  ACL MTU: 310:10  SCO MTU: 64:8
    UP RUNNING
    RX bytes:696 acl:0 sco:0 events:49 errors:0
    TX bytes:3168 acl:0 sco:0 commands:49 errors:0
< scanning is working from Bluetooth Settings from GNOME >
$ echo 0 >/sys/bus/usb/devices/1-3/bConfigurationValue
$ ./usbreset 001/003
Resetting CSR8510 A10 ... ok
$ echo 1 >/sys/bus/usb/devices/1-3/bConfigurationValue
< it takes a while>
bash: echo: write error: Connection timed out
$

Unfortunately, it is not solving the issue and I get the same result.
I will try to identify the device or the situation in some way.

Best regards
Jos=C3=A9 Ignacio

On Fri, May 13, 2022 at 5:01 PM Bj=C3=B8rn Mork <bjorn@mork.no> wrote:
>
> Alan Stern <stern@rowland.harvard.edu> writes:
>
> > (Greg, did that program or something like it ever get added to the
> > usbutils package?)
>
> (your) usbreset.c was added to usbutils in 2016 :-)
>
>
> Bj=C3=B8rn
>

