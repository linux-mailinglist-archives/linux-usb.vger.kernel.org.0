Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60DA24F35C6
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 15:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240236AbiDEKy6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Apr 2022 06:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349404AbiDEJts (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Apr 2022 05:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8B06E1707A
        for <linux-usb@vger.kernel.org>; Tue,  5 Apr 2022 02:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649151897;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qlAy1ak/kV6tHK9Bt1XWUiHugsXbSUUK6OAY60z+5+8=;
        b=SfWQy6GX/HLyxXJvwKkf0gt/lP/vPuuvtPhum+1Elqt39dEF22kUNpwFBoKSwlTXe1IItE
        Zk6ueTrTrFN6o2NXJXHjVAz2VSh0yaUFtmMDTf3DKyndNQc/mb6p0OsflWlGXCI5sBMQx1
        Ni/2074mR22jmMOxt2txCbo5D+PEFLE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-GWke8eNNPU-Upg_SXxf2Pg-1; Tue, 05 Apr 2022 05:44:56 -0400
X-MC-Unique: GWke8eNNPU-Upg_SXxf2Pg-1
Received: by mail-wm1-f71.google.com with SMTP id c62-20020a1c3541000000b003815245c642so1073239wma.6
        for <linux-usb@vger.kernel.org>; Tue, 05 Apr 2022 02:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qlAy1ak/kV6tHK9Bt1XWUiHugsXbSUUK6OAY60z+5+8=;
        b=eNet4Y2X/DKdYJGGIGymYuXyTGHpTf4k7urfzffYWy7nZE0pnu1G9mgbSIPtcyuAuG
         Sp/r77xZ6JwmE4wJ6y/iLPybQSzFvZnDxuxInTPypKGi3kymWrSS3RRoDdXFR5zuir3U
         oPjPeHHoL1HUu9q/3qGy9uWeqmkcIauPDubQwU0pCf5FOVVmI6bFln54632MjhiJRVjx
         lRJh79wFrAxy53dT4vm84BkTtp0e2jMf5l4WQ7vbkScmU1+763MrIx7YnHjqKJ2IEYLK
         t3o602YjRavjM7dNhC3+g1NAIz5K4C5USa2gky4d4GNHKtVvWjOv6+lT1iWY2NBIdEwA
         lRzg==
X-Gm-Message-State: AOAM531AveMjiw+WTdA0qGr6CMquL+rqWvmexPO1IIeujJQ4UfEhOb6G
        t9PiWJVd2oBT8LUcGx5lAEtWAJOfnkcljVBML7wjJQjGbsCfynNA+6mWeB78SzJBNEKghFFJrpb
        yQd5rURVgLvFyt3qI5pAA
X-Received: by 2002:a5d:4c81:0:b0:206:1a0a:a14 with SMTP id z1-20020a5d4c81000000b002061a0a0a14mr2042341wrs.101.1649151894298;
        Tue, 05 Apr 2022 02:44:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWpE/XeROexNdZa6r6+VHrJ+z5qdSYnqTgxi0gpvE8bk8A2NipXHyA+lP7fxdqtRRJBId/SA==
X-Received: by 2002:a5d:4c81:0:b0:206:1a0a:a14 with SMTP id z1-20020a5d4c81000000b002061a0a0a14mr2042326wrs.101.1649151894041;
        Tue, 05 Apr 2022 02:44:54 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-96-237.dyn.eolo.it. [146.241.96.237])
        by smtp.gmail.com with ESMTPSA id r14-20020a05600c35ce00b0038c9f469979sm1640418wmq.40.2022.04.05.02.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 02:44:52 -0700 (PDT)
Message-ID: <d3805bb376de6d908fc051d274ca6607ebda4e27.camel@redhat.com>
Subject: Re: [PATCH] net: ax88179: add proper error handling of usb read
 errors
From:   Paolo Abeni <pabeni@redhat.com>
To:     David Kahurani <k.kahurani@gmail.com>, netdev@vger.kernel.org
Cc:     syzbot+d3dbdf31fbe9d8f5f311@syzkaller.appspotmail.com,
        davem@davemloft.net, jgg@ziepe.ca, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        phil@philpotter.co.uk, syzkaller-bugs@googlegroups.com,
        arnd@arndb.de, paskripkin@gmail.com
Date:   Tue, 05 Apr 2022 11:44:50 +0200
In-Reply-To: <20220404151036.265901-1-k.kahurani@gmail.com>
References: <20220404151036.265901-1-k.kahurani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2022-04-04 at 18:10 +0300, David Kahurani wrote:
> @@ -354,8 +369,15 @@ static int ax88179_mdio_read(struct net_device *netdev, int phy_id, int loc)
>  {
>  	struct usbnet *dev = netdev_priv(netdev);
>  	u16 res;
> +	int ret;
> +
> +	ret = ax88179_read_cmd(dev, AX_ACCESS_PHY, phy_id, (__u16)loc, 2, &res);
> +
> +	if (ret < 0){

For the records: another recurring indentation issue is the lack of a
whitespace after the ')'.

Please address all the issues reported by scritps/checkpatch.pl before
submitting the next version, thanks!

Paolo

