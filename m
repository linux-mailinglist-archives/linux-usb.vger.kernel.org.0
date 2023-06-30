Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21373743C75
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 15:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbjF3NOO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 09:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjF3NON (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 09:14:13 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE0D3A87
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 06:14:11 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-98e109525d6so327317766b.0
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688130850; x=1690722850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhlgWAgY4yVPcTPf7GfhSzotQ3oDSgaBPH+AEZF5VyQ=;
        b=l1TGNcdmwUicsPDHlIMarhAC2JsuzKtjF3cxOiNU1Mix//w03yxN4DcPCpM/0XdNmQ
         n9BJQ+h3SpcgTb0xSehhvyj178eL3LHY3gHfd60s6QaeQ0EiKouOj7axMQG5X3vyyXOq
         dnD6FtTzjRi6riuQwVTWDI1DT2uapJQzfoAGLZgLJnMfbGjHm+dukOWZi9K8Ydn19YnT
         Jg7OXRC+othYz84/vxHX3nacJ/eG/5T8PTGnZ0FTXHntQx+E9mXjF2i/nf8hSTBtBgbX
         a9HBuaHKTP6mPB9dfFhi6T9RZP0PUOLy/95B+CNQqMiJO04NWghc+B0PbKCqXiN4JUJH
         CaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688130850; x=1690722850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HhlgWAgY4yVPcTPf7GfhSzotQ3oDSgaBPH+AEZF5VyQ=;
        b=fhcjf3lYdapw3nXC+lDrLB46n5VHlrSCwyL0OTYXiwGVKynHtFrN9Om6RJ9nzPUGK3
         1ZUmuxkbcN+bIiOujtPEa0S/PtUdrtCypn2rwUFH+NACxQu7n6NyG/HkzTs3tWCO6Y+V
         hzGAdGasT/CVj4qpPNDZr1c5nMHrSVopUH5Q8cXY+7pspTuRD3xdq7rt70yP+IY04trB
         /Rpd63aqeu1QrJjnYMDbu9sTYNPW1vYIdsky8AkYaXLcwgOt8mqFgyMCe2nhHcC5QD94
         v50B+3cX2qBN99QSxSvgKQzhZbx7b5D4nBEav2STPdRMqm84W+375pM/YToGsGhMR8MN
         Wn1g==
X-Gm-Message-State: AC+VfDwKjW6rCPcEw/aWsus/MaLy1A6CNHXRDZDkQux+rjxQmVulddTH
        YEatwC0GhwItoN3Mmww49zqHqskyDPxXrHmV6zM=
X-Google-Smtp-Source: ACHHUZ6uK2TLywDPoKITjBEXaTu65pYcqhr8WwPCzDDWD1Q0eIKtwOpV5KQK5h9e4fFtS9LwpVvzKa2bnbT8vlG6qss=
X-Received: by 2002:a17:907:60d5:b0:98d:f2c9:a1eb with SMTP id
 hv21-20020a17090760d500b0098df2c9a1ebmr7409008ejc.24.1688130849527; Fri, 30
 Jun 2023 06:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230630110401.2360746-1-yguoaz@gmail.com> <2023063013-fanning-crafty-4502@gregkh>
In-Reply-To: <2023063013-fanning-crafty-4502@gregkh>
From:   yguoaz <yguoaz@gmail.com>
Date:   Fri, 30 Jun 2023 21:13:58 +0800
Message-ID: <CAM7=BFoyE8XzS8g=U_wFH_AUE-W6C2tGKWzGP4+eCZTDVDgr_g@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: configfs: Prevent buffer overrun in usb_string_copy
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     dan.scally@ideasonboard.com, andriy.shevchenko@linux.intel.com,
        frank.li@nxp.com, christophe.jaillet@wanadoo.fr, jgilab@gmail.com,
        chanh@os.amperecomputing.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an underrun issue found by a static analysis tool (under
research). I suggest the patch because the code of usb_string_copy()
rejects strings with length greater than USB_MAX_STRING_LEN,
indicating a possibility for the input string `s` to contain unwanted
data (e.g., being empty). For the empty string case, the proposed
patch simply copies '\0' in `strcpy(str, s)` without touching index -1
of `str`.

Whether `strlen(s)` could ever be zero in reality is up to the
maintainer's judgement, since I have not worked with the subsystem. So
please ignore the patch if it is ensured that `s` must be non-empty.

Thanks,
Yiyuan

On Fri, Jun 30, 2023 at 8:17=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Jun 30, 2023 at 07:04:01PM +0800, Yiyuan Guo wrote:
> > In usb_string_copy(), when `strlen(s) =3D=3D 0`, `str[ret - 1]` accesse=
s at
> > index -1. Add a check to prevent buffer overrun when `s` is empty.
>
> It's an underrun, right?
>
> And how can strlen(s) ever be 0 here?
>
> How did you test this and how did you trigger it?
>
> And what commit id does this fix?
>
> And how was this found?
>
> thanks,
>
> greg k-h
