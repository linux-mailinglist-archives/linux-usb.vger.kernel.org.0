Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD5E4D063E
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 19:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238964AbiCGSUC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 13:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233567AbiCGSUC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 13:20:02 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F70970072
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 10:19:07 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id 6-20020a4a0906000000b0031d7eb98d31so18816630ooa.10
        for <linux-usb@vger.kernel.org>; Mon, 07 Mar 2022 10:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Ik6PnwIc/hNQRSEOmSUP2XjqA00iDrxZuoAM6QekVVk=;
        b=biE2r++EpPXcWVQO9N6Snb7BoUQfzERHR08SnT6Ora6gR5gLYsE8VU31DzUqUejJLk
         tJHsy+xNLXxmeQMYFsL8ChNAhY1UOVEPXRjX9oFcsgBHb06JJ2RJk0PEVL1BNnxK4e7D
         B2OV3q9Eo+HRZQ/FiSneWs5GhQTdCU4/+A21IQdn90iA+F2wgcbfKymJloe24bNgg7Gs
         l5DFx+D9hQL121zZY+H5c8K8KHenAEJX9FEwi+iwq4XVSWQTD/UAivrQHEMXLiRkhK2Q
         wFem78oXqwNVPL6qoTduvW2Cju7FtetIjscMJsh8/g/H+y4Kvw/lq5ty53nbDyIxxE5M
         9Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Ik6PnwIc/hNQRSEOmSUP2XjqA00iDrxZuoAM6QekVVk=;
        b=3ogai7CvPWtkYDK8wt2vwAZdXx7lCyJdfUHJdK37Hx3go7qi4qeozOc4jYeSP/zvH7
         +QU1tNkVj6a0WPskNY7rEDnlch20KhVXi77K+5/QkFZ1uZjvmIOEyxGEnBLag7cpnubI
         RT9s/TPAnChqOwuN9/5brOEj+DPRs6eY1cIkaONeuR8xs4AtpnJDokGT82eTwYZ7EDOE
         x/BUdUuY+HDgYp6NhBTNnuI54uhrMEEqW/2MBeHMqiqQPvgUaP21mX8wF3pUHxeFCep3
         WNAsf96NiA3yYx34uDEfgl+K7JrQtA7KxEL1/2S1SmXAcGX2xyV0Tjk/8ZRPDeGaY0dE
         koOw==
X-Gm-Message-State: AOAM531xmYYEikSEKz56REX2bHGK1AY5hoGl9q1Er6zJFRIfGYI+dOL7
        9G2O0srvIqrtmw9BHKDrozinzGtSC1nfJgB1cBc=
X-Google-Smtp-Source: ABdhPJzHM3512rYsGDQpuCeMGMAwRvpF/x6d0nU7+dSao69cSG3loHjY3Kki+C2GN0JB9EpmZpUTCKFIuFaNUO3/Fc4=
X-Received: by 2002:a05:6871:690:b0:da:648c:3b1e with SMTP id
 l16-20020a056871069000b000da648c3b1emr138468oao.62.1646677147004; Mon, 07 Mar
 2022 10:19:07 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6820:1058:0:0:0:0 with HTTP; Mon, 7 Mar 2022 10:19:06
 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <ivanroberti700@gmail.com>
Date:   Mon, 7 Mar 2022 10:19:06 -0800
Message-ID: <CAKiAiLBS1KV5YXD0zwhvjFxrfEuHsL7oV=p_GUSAZYrAL_B+BQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_05,DKIM_SIGNED,
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

Hello, Please with honesty did you receive our message we send to you?
