Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6759591FC3
	for <lists+linux-usb@lfdr.de>; Sun, 14 Aug 2022 14:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbiHNMdX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Aug 2022 08:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiHNMdV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Aug 2022 08:33:21 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4A61DA76
        for <linux-usb@vger.kernel.org>; Sun, 14 Aug 2022 05:33:21 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id i62so8372461yba.5
        for <linux-usb@vger.kernel.org>; Sun, 14 Aug 2022 05:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=TV0Sa0HfLzTTPm8dpu2oHMiOmThX28BMkNOgODOj3JI=;
        b=d4+ZUwz5e1DE+TwA1GHkhYrsG6/A3llhN6NZmSkOWd8+UR9W1RBELE0LnIT4+iXv/W
         zOUL83K9pFsIsYs+7z6yKpmAlz78CPE/+YDnEfDUpwg82ypKtQ/3NHNhslyHQZzIq8AJ
         UW8QcMpzbDMx8yHCu081eCtGM6qKBZcCB8mXEwfjmQ4JmVE0U36UdRzNkkn2kV7AteKw
         WyARXd1/eZ8MIy92h2+Rv54BDhQxH0N+iMQ5B9OPDfdIHewNRPCbf6oRquaBDdTNHBT1
         2KFMU4vhMCcoLv2Z8vgywtW+VSXuWSFsF+fJp/ViuBHp1fV8jz3NZfm6/8+ermi8oqmf
         yKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TV0Sa0HfLzTTPm8dpu2oHMiOmThX28BMkNOgODOj3JI=;
        b=DZVD3Kv/yQoCYsXhtWMxP4z0d0NQ0rJHw4qXLAuq9d0ISckyxKZ630f9LRVxXkNWB8
         4lhISqlrvs7Htr66oB1k9cwxO3QTkOFOAuMrcIkZPetaJeQJKYjXjerNkOu9Qba49otw
         Z86nhTxO12SAivAvmVBg4O6pV1JtOUMnUvryd8yip7Lwgs917n6UUtkQdhzKPYZgpLI3
         CvNP1S4L36qpNRjdRjzPVHuX19W8p5LuA06c2jlimEKKswn+Kms6sov631Jq1zusWl57
         Em+apkHHS/LAs/gxTjOXIZsqyMe5YMh2+Rph6o2970L8dTEkJZbgE+6AVEJibHLnaJGb
         W1pA==
X-Gm-Message-State: ACgBeo0b3/96ohR5OUMaUG1GjU4GPul8GgxlfmQweEwkFd0c/0N+RZNi
        iXaPzA2Q5mn0TAV75kZEeRSQcLypqhiC5sDRC2r4YCClp14ggg==
X-Google-Smtp-Source: AA6agR5YQLnAs/hNypRzKin54ru7KlIPYUpJPUvQKYbYOCjKKjU60Ywr9DPYqxrePJAUG8tXgI3lKkTk2grHVB91ZHo=
X-Received: by 2002:a25:9f8d:0:b0:686:9a3d:6f85 with SMTP id
 u13-20020a259f8d000000b006869a3d6f85mr3246627ybq.400.1660480400313; Sun, 14
 Aug 2022 05:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAJz5Opd7VxpLSdvDCivgKbazG-t8uGcqazMVjs864w-AhviuRw@mail.gmail.com>
 <YvdPr0Hn5eOPehIm@kroah.com> <CAJz5OpfDH3kJV5e9UqU6Tcw8NWHK5-iGFJHdkCGBzeNW-fCRUQ@mail.gmail.com>
 <Yve+avK9F4dCnvzB@kroah.com>
In-Reply-To: <Yve+avK9F4dCnvzB@kroah.com>
From:   Frank Mori Hess <fmh6jj@gmail.com>
Date:   Sun, 14 Aug 2022 05:33:09 -0700
Message-ID: <CAJz5Opfcy-P+HbRQ2LK_-9C8Oz5q=26qZ--ZfYV74YtzhFH1Bw@mail.gmail.com>
Subject: Re: [BUG] usb: dwc2: split interrupt in transactions silently dropped
 due to driver latency
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org
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

On Sat, Aug 13, 2022 at 8:08 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> Then please work with your vendor as only they can provide the needed
> support that you are already paying for.  Take advantage of that,
> nothing we can do about odd vendor kernels, sorry.

I'm not looking for support, I've already fixed the bug for myself.
I'm just trying to provide some useful information to the dwc2
maintainer in case they care about fixing the bug.  The bug is
obviously still present in the current mainline kernel.  From the
dwc2_hc_nyet_intr function, they #ifdef out incrementing the
error_count (as I tried to explain earlier, even incrementing the
error_count is not enough, there needs to be a hard error):

#if 0
/*
* Todo: Fix system performance so this can
* be treated as an error. Right now complete
* splits cannot be scheduled precisely enough
* due to other system activity, so this error
* occurs regularly in Slave mode.
*/
qtd->error_count++;
#endif



-- 
Frank
