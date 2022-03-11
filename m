Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FAC34D5720
	for <lists+linux-usb@lfdr.de>; Fri, 11 Mar 2022 02:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245290AbiCKBHl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Mar 2022 20:07:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbiCKBHk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Mar 2022 20:07:40 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A76CF389
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 17:06:38 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id l10so4324660wmb.0
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 17:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=LBbYRpychyx/epr4+qrpYhKlN5yyV6mbRE3oixtpU+Y=;
        b=jogiA0cu0bchfFIMdn9CM/TJYckB6QQN8+I6mpIXTbQ/Jf/UzT+HLz0qhvVGvYqXlY
         o+sHAny4gUXlxqdH00DezaEmF9QfDI3XBmtw5WuJ2hU6EWWkTn1RsHpIVeu0qs6h6oQb
         UApWDd783OrHk+tdmwI0OzMgLS3ijISu4Q6aC90ir6Pw9LdE7dLl9cP6670NaSt4WgeU
         d36NZaTYNJgyclpj49FwhFfcS/dWSCPUlvtuSklzI/56eB1AD9B+4ri5lICWFh//sdK8
         0aYByErIx6wZovZmHCIcIgAwpcrvxyUZQklWF+H8mdxS/QK+qTDDhxsYYH47RVTYYuhM
         BICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=LBbYRpychyx/epr4+qrpYhKlN5yyV6mbRE3oixtpU+Y=;
        b=YTMTy5TEi5wzkavAlYzi7WM96rukkhE8Pd7tn3nBV/rLs/ueLVNfH/HATLvpje9AYZ
         AFHqZ4ziPptciDzRJg/+XgYVZx+k8B1H/8lkBYxxfcTfTHcwjuxPAthne7COKoaCV/ib
         TMN8z6WXFJY1jZcDLsWg7BbbDPlUEdhtRvE74fBk3pZ7gKFgPvv6GWjR0pPWHfT6LVKL
         vIv2ZmtlfdXklC8AMs6hD5kcp+hUf3plbz0PfGmVaNhMppyID/9e/gATfWAWiHc7qorl
         xUiouEUCJb4E4FdJL20Xiavsr0wlUAUgxm8GfQYY8GWsFTW+E1wx+1cIgidg46RQm3tY
         GtbQ==
X-Gm-Message-State: AOAM533h45Tmm83farV3MWFEWhmyuv2m78PHPxUn4vhiRkmVtsKol0SE
        5WGmlXh1GlUk8rK39mudYhtKEmlhrGewPFNoFtg=
X-Google-Smtp-Source: ABdhPJwxSUkrvPoqY/sp+FZFQ8fo2TGE1Yg8jOMNl6v2gcAMaXEKsvuq/hXpCDBACUJOEZ7Jn7ex3V3i8SaPFGHkoxY=
X-Received: by 2002:a7b:ce84:0:b0:37c:52fe:a3ff with SMTP id
 q4-20020a7bce84000000b0037c52fea3ffmr13464584wmj.48.1646960797200; Thu, 10
 Mar 2022 17:06:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:adf:eb4b:0:0:0:0:0 with HTTP; Thu, 10 Mar 2022 17:06:36
 -0800 (PST)
Reply-To: j33ciss@hotmail.com
From:   Justin Cisse <ka365441@gmail.com>
Date:   Fri, 11 Mar 2022 02:06:36 +0100
Message-ID: <CAGU2KhtGupuKfofeteBM6MSC9pEbuTdzAquSmSkEhOQmzSGPNg@mail.gmail.com>
Subject: TT:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
I solicit your partnership in a transaction business that will benefit
both of us, detail will be disclosed to you upon response.

Best regards
Mr. Justin.
