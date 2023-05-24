Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5C5570FEEE
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 22:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjEXUDF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 16:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbjEXUDE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 16:03:04 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89EE2A9
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 13:03:03 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64d2ca9ef0cso1047281b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 13:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684958583; x=1687550583;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N3tQa/xAjjFjMbYTIPvabJVdNLC/DkLFMMTZCH3qWNU=;
        b=Lrd1tEGOhU2Y+tJ+O3+OEMBL2HbhzQWoYJYPgElFvrIlrPNFV1V8CFMbHi2I2QTe3A
         v1e/O/Ew9A8Ge+o4TPP3730C+DR/ed3KAaMVsR4/y/fBg692UMODvATnzseeTBWsb11n
         oeNxxrKmy2/jiLjy2DjY1u03SbTFIsgZPiFC/9z0m3Ya4PEFa4H93krRvzjmjBa/ilk9
         bqJxoJr8eBTvZWNmjeITZx++o8bZc6P3jt0Kt4oiRJtVaIW1CRXfaytwWTSidns1hsxj
         rwUeW7icAtLsWqiDI9Q7NMyJrIvOgDUM2khrGG0gqX0IIDIA1VC0xGwiDo58uDuHJlUN
         Z2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684958583; x=1687550583;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3tQa/xAjjFjMbYTIPvabJVdNLC/DkLFMMTZCH3qWNU=;
        b=dpCa7cSddPzTFFJhj1nJlfmj2v8jBn0D4/AMg50JqkWitgsC04rPmArt730u6NG03o
         QF9nZ3X7SolG+WmkxD3O7kiNITuCQyUz5tUBnaTwVcH3ycEDPLSlWXd8AwY5qzMPOeW8
         maI4uW7asXKcCyvS0ftoL0Je3vdr/AR/iV9zRONz9afM/wYcEvaMgBbkTCQa3PnHHpJT
         +OjT0V55WZUo5u7RtcJ+vK1UvCZuHh/ovwjoAiT5VmUv6gh9bFx5RPqn/YxIyP/XOyIl
         7DAGiN2iMQKLTlDTqhLLSw+I33djw21+WG7eE55dMIFQTYPpJi3Q7bW73SFVRFjXxL9G
         MFWg==
X-Gm-Message-State: AC+VfDxWdEOHB1PySO0OF5QFtf4Q+/xqAsjOs/44ZksUHli15WnezSes
        2DJkhYa2mRA8Ne2AsZ4GhnkXFXvM/m2Fv/4VNgM=
X-Google-Smtp-Source: ACHHUZ671FZoBCy4c+gvfHFL801vxgrxQn5rjE4hDJkx9FkZBhHIK4PvZxBFkuBaH6LBZMD64pamrryv27EPjqcHpm0=
X-Received: by 2002:a17:902:c94a:b0:1a5:22a:165c with SMTP id
 i10-20020a170902c94a00b001a5022a165cmr23799037pla.0.1684958582716; Wed, 24
 May 2023 13:03:02 -0700 (PDT)
MIME-Version: 1.0
Sender: mrssabah511@gmail.com
Received: by 2002:a05:7022:4193:b0:64:1baf:d26b with HTTP; Wed, 24 May 2023
 13:03:01 -0700 (PDT)
From:   Elena Tudorie <elenatudorie987@gmail.com>
Date:   Wed, 24 May 2023 20:03:01 +0000
X-Google-Sender-Auth: ytDycDF7Src1dGaTWaQkJrBrtC0
Message-ID: <CA+F6AOCMrq-wrq_1Zw0Swt+s7TJspstGxJE7Da8tj-KtAsPiFg@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I am Ms Elena Tudorie, I have a important  business  to discuss with you,
Thanks for your time and  Attention.
Regards.
Mrs.Elena Tudorie
