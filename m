Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 587515AAB65
	for <lists+linux-usb@lfdr.de>; Fri,  2 Sep 2022 11:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236041AbiIBJ34 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Sep 2022 05:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236094AbiIBJ3W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Sep 2022 05:29:22 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44F4CD7B4
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 02:28:37 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id gb36so2624275ejc.10
        for <linux-usb@vger.kernel.org>; Fri, 02 Sep 2022 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KHNwV5mx6gUjlOLCRF/PLTfLRK6Nfmd9+PtbuISOuEA=;
        b=M0KeLwxzeSoLJxa8C1OND2HppYCPxKTP+rai1VGnNJLpVe5btrhUxlfQzFc4sRks9N
         Ft0uaS5zd772/WI6qZ+t1Dn7fM7tpxF9Kxk05ZFYWQH+y8akl7KHdRs90/MyhoihNUL1
         iA5PBOvvB71OecyzpG5lIczD0+vDPUcrTWw6uaLegSu57Ky8WplwpIbCFzR+7YTPaFSW
         0xhSV25GhqOo0TMfWHeE4Di+iPEXebOa3/d9C+noOAGDJX9dJtf/59GcdDEGwcmsiisT
         3ffxu+EemzvN4fPjqmTyAQXI/CiOlduE6N3Sv6HiKJq3ilt4TiXyNTWG/sUD+CyOm9vT
         p/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KHNwV5mx6gUjlOLCRF/PLTfLRK6Nfmd9+PtbuISOuEA=;
        b=QT2btd8uGJLUnTEGNyFgO8wiA0GEjFEFGg4jMG53kmmYk3xtHiqaNX7zl9OehYQWai
         F7NLD5mQ8SdCa21Qbdf38sLGp8u7LZOR7G7j3DI6uC2iDEYaricynRCCiJcYf5pWn5Gl
         YMT9tArN9gmN2BNnNqRhSc883rKo7wYNo5uBR8/qEWUxchXXPAwcpBGnQDJsplbZIyr9
         d0RHlBfxtXyw4uO+X36XJHcm0MfyvGdBvVEYwvbLELApi3x0qA8abvtyIuc9DWs/8KM2
         1qQW1pikKzLkAYcnda09/M6qTz7I/R3OI8Vme/ZwI2mfCNZJny1Ry8ZhX6b9zEWNLZmP
         ArMQ==
X-Gm-Message-State: ACgBeo1UDhel6uAVqSB0G80rhgnVdA0f77iCqskb/weJ7+cUvL8HNBMJ
        nx5NfgIBDBar5tTSYPBcoD5mu+p7aRCJqrd/+PsW2Q==
X-Google-Smtp-Source: AA6agR7FYxmCIOGzTe5dYOt6peYrFJvRHIR7rydBTdT9Hv3Hy7Ey+n+P6uBKXLJQmUb2YiRybJqE/2OV8ewKZip5ycM=
X-Received: by 2002:a17:906:cc57:b0:73d:cdfd:28b4 with SMTP id
 mm23-20020a170906cc5700b0073dcdfd28b4mr25688033ejb.211.1662110915660; Fri, 02
 Sep 2022 02:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220826075839.292615-1-raychi@google.com> <Yw4GH4U5ULV3VFSY@kroah.com>
In-Reply-To: <Yw4GH4U5ULV3VFSY@kroah.com>
From:   Ray Chi <raychi@google.com>
Date:   Fri, 2 Sep 2022 17:28:24 +0800
Message-ID: <CAPBYUsA1oARNuGus5uzxZ7Co+gJrm2V_axCPsyZHhp85cndaAg@mail.gmail.com>
Subject: Re: [PATCH] usb: core: stop USB enumeration if too many retries
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mathias.nyman@linux.intel.com,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Albert Wang <albertccwang@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Puma Hsu <pumahsu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 30, 2022 at 8:44 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Aug 26, 2022 at 03:58:39PM +0800, Ray Chi wrote:
> > If a broken accessory connected to a USB host, usbcore might
> > keep doing enumeration retries and it will take a long time to
> > cause system unstable.
> >
> > This patch provides a quirk to specific USB ports of the hub to
> > stop USB enumeration if needed.
>
> Where does it ever allow the port to handle new devices in the future if
> the device is removed and then a new one is added back?  Or is the port
> just now dead for forever?
>

I modified the patch according to Alan's suggestion, so the port will
be working again
after clearing the quirk with the v2 patch.

> thanks,
>
> greg k-h

Thanks,
Ray
