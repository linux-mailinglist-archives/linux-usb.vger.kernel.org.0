Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 933934CD866
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 16:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237124AbiCDP7B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 10:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbiCDP7A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 10:59:00 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CCCF6F48D
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 07:58:11 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id kt27so18501613ejb.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Mar 2022 07:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ikOaY4WgNW4ap5y0cDzLfLJZo+z0nd9LAiZZqby3v7I=;
        b=WslIidjFM8mdyg+UgPm5PsKVm3kFWUGXR0xXHc4pMcMEBEclhWFInmROkqrCcWfrmE
         yXZ+cQ8RcZEgxNmbrmU23fuqHzyaDobA+jE1wILU7jhV3k7F+IwPrnl1FKRbaE3dhrbA
         chIUWvZ7SPjdCLnfYMCSYVSVotkYmRxaK9ef0Bja5Ku+WpVjehl5Bz4r2uDnibQCx3km
         BF6/Z3OPEYAYU8VEXRbCBtx5JXcFdhriR93d55G7WwIi+b1Oq4iaNLoAOBEAmC/ogpu9
         Qm1c2T/0KlYyWE3fkiV+CatJg9L9t6b8ssGD3ny2EDvLjFBNeDaS/MN5u6MbWR4slKBy
         /Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ikOaY4WgNW4ap5y0cDzLfLJZo+z0nd9LAiZZqby3v7I=;
        b=ifM/WPzkWwhvhrg8XqLQW/9PFyGfRsY6lXepM4husis9fyVh9fZRPZEeJ0yfIHrtk5
         UUZrjDt9tL4YiIini8NuLVgQDhkE8haLMDP2PQcTQ7bVOrKaoNfNgvPBuivxEX7We92y
         PLVcMHMRMjfhkyGV92owjc6sp1pwkW5fzgFuMjHAxYBW4j4FKKx9ZTLdu4THo8mEXEKG
         +DoAVuIuukGiIXC7PWQfAh+qegqLo9iaPpfwNv6/u93CixLqj6ZS3Wqb2wxvO4nD2TSG
         TZBsoBDBbFVi1jEEyY3KMfEfUodxBc6fpGSd0z2slzvcbe4YStOjw935c57LncYfsmMg
         aMVA==
X-Gm-Message-State: AOAM5327tTmZ9GbI3UOCh0BoGdwd88zGUljxlEpCdTm9y2vx+jTAfZdV
        Z6dR/UxGDgEtmY3mAC+RWTVZUStsVx0IcG+MnT8=
X-Google-Smtp-Source: ABdhPJwMOr/4FiZmIV8Xmk69pxcWDoGZkMkn+sNuJYI72rielxIxZf01G6EpjVQbJe4WY002H5Mw4ndxUATUjaazQnM=
X-Received: by 2002:a17:907:7f06:b0:6d6:f8f7:2655 with SMTP id
 qf6-20020a1709077f0600b006d6f8f72655mr14249497ejc.658.1646409490028; Fri, 04
 Mar 2022 07:58:10 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5AJ3j0-LUHX9MNdHQotrG+chPhQgB15xiHTm9r9wuvdLw@mail.gmail.com>
 <CAOMZO5A4zQM1dLhL7+Qa2GEW52eb2PbGjBXRKZfvA279k6Pemg@mail.gmail.com>
 <YiIeEHMc+tWE0coi@lunn.ch> <CAOMZO5CioYoddT0kqtf+wOTvvxArm9ipW2bAj84qKM_eQgMcjg@mail.gmail.com>
 <YiIndfh0B87LRYnI@lunn.ch>
In-Reply-To: <YiIndfh0B87LRYnI@lunn.ch>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 4 Mar 2022 12:57:58 -0300
Message-ID: <CAOMZO5BOREQcH9e5oL=QQsH2VsijQTPPA=pEX0KCjjnveaVppg@mail.gmail.com>
Subject: Re: smsc9511: Register access happens after unregistration
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Schrempf Frieder <frieder.schrempf@kontron.de>,
        Martyn Welch <martyn.welch@collabora.com>,
        Marek Vasut <marex@denx.de>,
        USB list <linux-usb@vger.kernel.org>, oneukum@suse.com,
        Adam Ford <aford173@gmail.com>, peter.chen@kernel.org,
        Steve Glendinning <steve.glendinning@shawell.net>,
        fntoth@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 4, 2022 at 11:51 AM Andrew Lunn <andrew@lunn.ch> wrote:

> But why does it return ENODEV? It seems to me, ignoring it is papering
> over the cracks. Why cannot we access to the PHY?

The -ENODEV is returned by usb_control_msg():

__smsc95xx_read_reg: -19
         usbnet_read_cmd: -19
              usb_control_msg: -19

 # echo -n "2-1" > /sys/bus/usb/drivers/usb/unbind
usb 2-1.1: USB disconnect, device number 3
smsc95xx 2-1.1:1.0 eth1: unregister 'smsc95xx' usb-ci_hdrc.1-1.1,
smsc95xx USB 2.0 Ethernet
libphy: *********** phy_disconnect: 1
libphy: *********** phy_disconnect: 2
********** returning -ENODEV from usb_control_msg
*********** returning -ENODEV from __usbnet_read_cmd
smsc95xx 2-1.1:1.0 eth1: Failed to read reg index 0x00000114: -19
smsc95xx 2-1.1:1.0 eth1: Error reading MII_ACCESS
smsc95xx 2-1.1:1.0 eth1: __smsc95xx_mdio_read: MII is busy
