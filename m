Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 034C8784B84
	for <lists+linux-usb@lfdr.de>; Tue, 22 Aug 2023 22:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbjHVUhW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Aug 2023 16:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjHVUhV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Aug 2023 16:37:21 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB29CEE
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 13:37:20 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5232ce75e26so815a12.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Aug 2023 13:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692736639; x=1693341439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=621Dqja2RNYBFFHxmHaf8VVJzOZCsbe/JAuSG72Lm5M=;
        b=Qf4va+JJGu83spSuvNpiszBgy/kH1iwdNNXWCBAZmhHIlX75e2TwfBBue0Qbx54L6o
         juGixw46nbOVFnTinQGxBNf7kqc1pCXq/bCuX3aZ1wUtgQOqMJY74Kd0ZHPenB793h46
         6GGAXUgXnAqEca3toJ/UfpCyqwH65Zcqpj41gYgmD+I33ZJw9gmo602WqDWN1WXuCNuu
         xj+fBTsQeRzlCB/I2e8tFx6H4rig8Uy1foqib4hViYRGmHi1i78DPdNOYY2On+qr3WMB
         MlNhJmg0t5X/zKr2HNFlZbRIipmFxtS2UjmRkiS8lDU93qzZgtuO17oNbc56lwo6SctM
         UCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692736639; x=1693341439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=621Dqja2RNYBFFHxmHaf8VVJzOZCsbe/JAuSG72Lm5M=;
        b=Cbc6eToPvvkBZZMLWoVOnOQeqbt+wd49HeBhdtEytlY5+t56CyRWhgK6/Y31D6zfuG
         XPfgm4UH5TdhikfeUssA4UGnCWzzdogbxjbdkcZHk/hbwG2j24guMBla1SJ+gXCwNed5
         AdnfHaSDjYrOH9O5tFUUdXybIrfXIqE2pMXUSf9G9lFSc2Lghz6N/SVVrcaDICRZwPzd
         qTbDrlPirV4lHaDYuJl++uaXwIl1OmdoshZTEy4JFZiWLzNneMzFFSpw4iODJ9nZLKUL
         rnB0dJ/Lm12P2nopulT0FMZobbAn7rZlPgFXPAu61++v7k0LLyq5AWu1EaVuAmAlNqLb
         mQRA==
X-Gm-Message-State: AOJu0YzJkdoWNfUUTXBbpmhHneDmQptKptbSUKTu9p2Co4BY89mR2kTI
        jvEJTuk5Atf60oMJ/iqupXLsSbii2Y1Usg1K/8Xcvw==
X-Google-Smtp-Source: AGHT+IFoCsdtugQC1NgLocnGbVdSHy/DAl3o3XYzBnz31F2BWo2BiRQvWRAUz1StSS4DOMOa924oiZrNR/QOFtwI6dc=
X-Received: by 2002:a50:9fa9:0:b0:525:573c:643b with SMTP id
 c38-20020a509fa9000000b00525573c643bmr154602edf.7.1692736638776; Tue, 22 Aug
 2023 13:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230731165926.1815338-1-rdbabiera@google.com>
 <CALzBnUFH=eQmhdpkt5_czKsZ22=u6yDoZZ0TX4eJkHGbjLANAw@mail.gmail.com> <2023082231-strode-pretty-f5a3@gregkh>
In-Reply-To: <2023082231-strode-pretty-f5a3@gregkh>
From:   RD Babiera <rdbabiera@google.com>
Date:   Tue, 22 Aug 2023 13:37:07 -0700
Message-ID: <CALzBnUHXnRjDMr2BaGp4btY3HZu_j4=VB8S-FUC1jiL_aoHBJQ@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: set initial svdm version based on pd revision
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        kyletso@google.com, badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 22, 2023 at 5:38=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> What patch?

My previous email was a reply-to for the email containing the patch, at lea=
st
when I look at the kernel lore it's accounted for with Message-Id
<20230731165926.1815338-1-rdbabiera@google.com>.

> And note, people were on vacation.  If can, to help your patch get to
> the front of the review queue, please review other typec patches on the
> mailing list.

I'll start looking more actively and helping where I can, thanks for the
advice.

---
thanks,
rd
