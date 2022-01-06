Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCC24486806
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jan 2022 17:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241476AbiAFQ6M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 11:58:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241426AbiAFQ6J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 11:58:09 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77889C061245
        for <linux-usb@vger.kernel.org>; Thu,  6 Jan 2022 08:58:09 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id n30-20020a17090a5aa100b001b2b6509685so3790768pji.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Jan 2022 08:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=xyfgIgG66PC8+je8Z6V1xtrTw6/UziLsexQG1pLOFCM=;
        b=mAbIl2AtT9f8W/CHtidQ1sVgsdOrF5MXyWnnSgmmcYWYT0g970nbXy8Ca7n7/dFuk7
         FkNh/yS2O8c1q+CMGBkt26hKfhmY8ULuzmaLYCUYb2w7xuXMiIMb+6Za9bQYt4xty10C
         CNQ7wDFRguG4Lu1rSS6knhP8sgkmtod/NNmDbEajuntZG1f/yxKlcQmBWOLyL7WDAnov
         m3AV7UZkTV+Rsq2UvOksTWanAwi1DKESaovOpRJO1vdC7yN9oCBeMUAq/F5oXt1+WKzN
         gSjH/BLGumShDs3JLWDV7B5/PHLVYdHgSS30zVDO3aVghuWb9JPeZrUVE2JsPwFwKFAH
         TF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xyfgIgG66PC8+je8Z6V1xtrTw6/UziLsexQG1pLOFCM=;
        b=YV841V1uTv0oxuDf/DTuboVehwTNZ2bPnIutJOIB8b3k6eDhGbSf54xIXHL+D+DMy6
         5e6egh2+Dw9kgOdFL/1JY1S1qzvA8W+BEVydpOxTaW7+a2JOOZ5NqwTOh3XTBOhHlFgc
         m7wfMTBalK0NUG3zbk+RatZorZzvnDMGEp/jyIJE4xUagK9cQJHcLyD1pCUEecql/iE6
         Y9W+UaOZLfLpGaPDigjQmuW97COzFiXUAg8OHZ8+yKvOLzEzWVHasqAbpxx0KA6IWEAP
         Wm3Va5dbfi4mCsZ+n2I/0Ar6nb/qJc9OFB4Cpgi9+HuYnfk/uYG0IgtsfcArAK+qmh9u
         BqEg==
X-Gm-Message-State: AOAM531CWnDIiCT7uxMxBQbVsqEZByXJOrgFRZa8Mfm44YBy0E4rzpMv
        nIl19MXWZ311ZSfWCkzeX0ethRvSlcgzDPRT9NoGXu2A
X-Google-Smtp-Source: ABdhPJw1l8N84iMLkhP4bdsACnjqGaN/meFDl7b3eKHrFluU49LC+0hqxee9RKT373eLIPpuZQkqvixIY34BzI5dEsU=
X-Received: by 2002:a17:902:dac7:b0:148:ef58:10d5 with SMTP id
 q7-20020a170902dac700b00148ef5810d5mr59712390plx.124.1641488288906; Thu, 06
 Jan 2022 08:58:08 -0800 (PST)
MIME-Version: 1.0
From:   Steve Rinsler <steve.rinsler@gmail.com>
Date:   Thu, 6 Jan 2022 11:57:58 -0500
Message-ID: <CA+gXaa4wfmezp+Zw16Un7kqu8X8AnPDibq2tWYrzKqV2Z6rTAw@mail.gmail.com>
Subject: re: Differentiate hardware from software usb problem
To:     USB mailing list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Follow up to my original post which was copied here by Alan Stern.

Noting continual flow of disconnects and reconnects which eventually
freezes my computer when the internal intel 4965 mini pcie 4965
wlan/BT card is activated in either linux (4.9 and 5.15 kernels) or
the original Windows XP OS that the system came with in 2006.

Trying to understand if this is hardware or software.  Attempts to
disable BT to see if wlan would work (removed bluez, blacklisted)
tended to eliminate opcode errors, but usb sequential
connect/disconnect messages are continual if I allow wlan to be
active.

Maximum success was to be able to successfully scan for wifi networks,
but haven't been able to connect and the scanning took many minutes.

Have downloaded a version of 20cv tool suggested by Alan Stern which
is suitable for Windows XP and will see if that helps me to define
hardware issues better.

Steve Rinsler
