Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24F29561F7D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 17:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235920AbiF3Pkf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 11:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235612AbiF3Pke (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 11:40:34 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E65236152
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 08:40:33 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r20so27908413wra.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=TFGxfKfYNc6FX30F9sKmEL18XnIK/Iwh98w/L1TSaX4=;
        b=VjR75jPjeHMuNYfKKjrf8cx13/jz3teIrRwSc8J+X20rNhFtUlpixLZCQkPyUOu10n
         pyQBEJ2Jao8DNxDeWSF0BYwblFsr6LJC3SIPU5fCsIP+XgXV2FV0B8RCro/FQssOELSj
         GPN+GHl7EkJS1VuMMbxRMCX/1P9YcwWPefg53DszGetckDSyDA4c5jp9FTRIaX4CRDvZ
         8nCgodVELCeNjldqycSFNW7/xaKyfkWsE5z27NDEKSi2VC2GInoPIskBCqbeqRnINu0y
         rkF/cj7xvPCyXMcynz29LGPqd0bJMVyytw/P5VOgDZR6Us4F3ilqROcrBKMEIhx3R3tR
         Lv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=TFGxfKfYNc6FX30F9sKmEL18XnIK/Iwh98w/L1TSaX4=;
        b=rNzBHZOSOPTnSIt+P1bHvGrGIz8piVx3s26SklxUT/I8H+GzGJIFIVLe8QuiC1Za3P
         wX1Oq3FYzfI7RHiah29ZYZNPJRl0O+3Z7e4eI/wKuDaWVYCj+Ywz3jBdFnlgd50Y/SQW
         6s1BWoGuLnt3m9u4FrDqMvOnLSY2bL53aZJhlpz3meuf1bqnOa119YIHslsQPhL7ueor
         yjC7y+KVzXyNICmjEDxdwOzB7spIa0KoMvwolf/ZbInow2PLwCsbUccR8H0jjKKCpRlb
         xzBHPyyiPOQa4Db7F/luqBYrjK9591q5HI5fsgSAVUxn9eZRoKUcvR4tCz6/MqC/oTie
         5HyQ==
X-Gm-Message-State: AJIora/eiAmAm3A9VRVQ98E+uAjzWfsHrEgpOUdv1Zqv+s42MQhM0y9Q
        M2n19DMzCxuYLIeT+UotICr0/bG+Msg=
X-Google-Smtp-Source: AGRyM1tGd7PuhRB1cZkNCigsVXhiTtCVKn7FwUkxRkEi7n12alS7brMnMzC1YoS3gHN1qNhmtL4JjQ==
X-Received: by 2002:a5d:6d08:0:b0:21b:bb1b:d5f9 with SMTP id e8-20020a5d6d08000000b0021bbb1bd5f9mr8872396wrq.524.1656603631652;
        Thu, 30 Jun 2022 08:40:31 -0700 (PDT)
Received: from DESKTOP-L1U6HLH ([39.53.244.205])
        by smtp.gmail.com with ESMTPSA id i6-20020adfe486000000b0021b892f4b35sm20298220wrm.98.2022.06.30.08.40.30
        for <linux-usb@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 30 Jun 2022 08:40:31 -0700 (PDT)
Message-ID: <62bdc3ef.1c69fb81.8c639.7456@mx.google.com>
Date:   Thu, 30 Jun 2022 08:40:31 -0700 (PDT)
X-Google-Original-Date: 30 Jun 2022 11:40:32 -0400
MIME-Version: 1.0
From:   bryce.dreamlamdestimation@gmail.com
To:     linux-usb@vger.kernel.org
Subject: Estimating Services
Content-Type: text/plain; charset=us-ascii
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

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0ABryce Weems=0D=0ADreamland Estimation, LLC

