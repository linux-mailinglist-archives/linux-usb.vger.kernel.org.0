Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A4F63241E
	for <lists+linux-usb@lfdr.de>; Mon, 21 Nov 2022 14:44:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbiKUNoG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Nov 2022 08:44:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiKUNoA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Nov 2022 08:44:00 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745A0290
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 05:43:59 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id gv23so28641406ejb.3
        for <linux-usb@vger.kernel.org>; Mon, 21 Nov 2022 05:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLuxvrtTwLpjQCdZkBOlAPtT4PuOt7o3XUb4SWGRYeY=;
        b=oZgQIeHI8fUBrBK0IzPI0CwS3tfHJMWbkpePnEknmN0uMPcNoktKEgea/9SyErC/lE
         EbTRiBHO8z5pMReDK3rs5PQOMXeczhBD58SuBvPE3yu6RuzsYP5iKlBHdtpCxAl2g29c
         SOMV79VAcEoEtpIyEv3weHtLQdZW0Lh6CyuOrdGvzEmzuHLHxdHEnWYGfxMqzUpUWp44
         PpfzZ2USaG3aNctWdH0ZdL2FfC2t+MU2wdhBhwR5X/pfBuXyHyjYzWr5EMRr2BdBi48D
         K6hXtmdOx1IYJYCpS4IzgvBRwTrxn54M15GWL38oipDDDGOqwN7av4yIPayTbsWTpB02
         +yoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLuxvrtTwLpjQCdZkBOlAPtT4PuOt7o3XUb4SWGRYeY=;
        b=3MsvfQYtVF+gvXMj21Eun8DoIPBM7CXiSNdZ8GfZ+73K0vOn1s40ZZDVZT8743tFJX
         +HFU1yl7wsbsSujAIJQzgAkpz4M2Ah+TsdAB6cA2cqw0wFcV3rypstRWZWuENDXH6phk
         Hy4erTcflaXTJzWX/RPy0LH5eWZfmPrGeYssugopseDWxC6xRfFh3S2T18zbo2Yhsns8
         QFBmoxpxf4tJfXtrRj0CXR1/JLzfpw6RNl/lX5fUKYCpuGcNSSu1FwlYzfWNw/RPqpfc
         C9m+6/1IZbSd5sfxDlRQUR9weBzR7WsMNDcReAkk59IeN2pkQe8y/+3IzFFhxLNnDtRs
         Ht4w==
X-Gm-Message-State: ANoB5pkeDySeqVT4aiWzB73iocHNAWBc+73j16i1Ce28f+0qlbjg/CEz
        mgqtOF438WYVbdv0Gs/cXjeroIg0qe/8rRLb74Q=
X-Google-Smtp-Source: AA0mqf5JclXnQrwMnS+iyAukB6nEVFSVgGfWvxLcPyclYgQmCIEjbRqa8INzQjrtzO8FDhcyRq2WTUOpU05Ib7Uqu7M=
X-Received: by 2002:a17:906:da0f:b0:7ad:95cf:726e with SMTP id
 fi15-20020a170906da0f00b007ad95cf726emr15780841ejb.60.1669038237931; Mon, 21
 Nov 2022 05:43:57 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:905:b0:24:877f:7460 with HTTP; Mon, 21 Nov 2022
 05:43:57 -0800 (PST)
Reply-To: thajxoa@gmail.com
From:   Thaj Xoa <rw36223@gmail.com>
Date:   Mon, 21 Nov 2022 13:43:57 +0000
Message-ID: <CABnv2bu7b6pNS+RdS98u0G6Zc4ZLndbFdw_EznJDWAhNdUxMog@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Dear Friend,

I have an important message for you.

Sincerely,

Mr thaj xoa
Deputy Financial State Securities Commission (SSC)
Hanoi-Vietnam
