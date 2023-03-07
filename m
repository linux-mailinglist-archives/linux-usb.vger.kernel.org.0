Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B27F6AD341
	for <lists+linux-usb@lfdr.de>; Tue,  7 Mar 2023 01:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCGAYR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Mar 2023 19:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCGAYQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Mar 2023 19:24:16 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B067133445
        for <linux-usb@vger.kernel.org>; Mon,  6 Mar 2023 16:24:15 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id ks17so7929243qvb.6
        for <linux-usb@vger.kernel.org>; Mon, 06 Mar 2023 16:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678148654;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nd4mttR77YQL1z6+/fOV4N+YFrdkIjWP188E6svLmU8=;
        b=Y3vVcPu7tXfhUP7e2WRY2o0B9//nOewCiBZdj1jW0yY05ZsTSaGprwAXRNfP/jF+jA
         M8JbGu6YM4Map0JG+udt18NvflukRZ11H3hva3D234mBKFiKZkBaf/qNu76eDyEjBQj1
         i8tGTfbFyTbFh6wfFZIXUXbKDbaPFbQJ2d6X8PxVcOXX9DnZeEYQ6TR5GUY7gQQQmKsT
         T6GoiWVpK3MLSBm514zWiIOQC1vCEYv9cit49GP01TY/I+YZ1lxPlvRdm3YnBPECA0zl
         aftMPrLL6MLvJtv+B042GBePnO6ovuNQIvdiRxGq+wdSB5sbAIIqOPaLs8nraGkr7o5B
         Q6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678148654;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nd4mttR77YQL1z6+/fOV4N+YFrdkIjWP188E6svLmU8=;
        b=eQHWRGkcvfkmq3PJZSumVYw1OKWZ36mSMiTJLn4UrS/NhwK1dXMFEB4MkUcjhNjakd
         hvf016Kc6uhxUgLpj0qRmAbf3c0MaxzyaGZL4A79JMZA94cbc2vXB2k2N5tc9s62sZBe
         X+SamUHOEAxpNr3TMHy8e+UPZuTNhcU7XHYMrZJZjNWozeWWaFVj+ZGzjiOSi+ehEyq5
         0mkzsNvNTctybK34Rjv8FH/FFzAA0apuhtPHXZErUIIXBfNClaG50TVILalrMvd1E+t+
         DOtcUVzG24tEwLSPDFUiqg2B8oNpqDjx0pN067Loh5icWavpiXy056It5WmmlK5BqeZ5
         zsag==
X-Gm-Message-State: AO0yUKWNdIMo8n2ulZYAAIvbnzsp7e7Mpery8BVSa/Qdl6U3LTCEFy2o
        5YbFwO2Gfhd6Wm1RWiD68jsSCfSlr0M=
X-Google-Smtp-Source: AK7set9tU3AHOeAIKuEhZgSWw3O2ia8r6Zlr/yNTcBKWc2PNF4Jd8sP+TN50FYWjM7KLdk+IxHKNQA==
X-Received: by 2002:a05:6214:627:b0:537:4b09:670f with SMTP id a7-20020a056214062700b005374b09670fmr21124618qvx.25.1678148654751;
        Mon, 06 Mar 2023 16:24:14 -0800 (PST)
Received: from [192.168.1.198] (c-68-42-142-238.hsd1.mi.comcast.net. [68.42.142.238])
        by smtp.gmail.com with ESMTPSA id u19-20020a05620a121300b007424376ca4bsm8409071qkj.18.2023.03.06.16.24.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 16:24:14 -0800 (PST)
Message-ID: <4772c6be-7918-9ab0-3dd5-983b293cf89f@gmail.com>
Date:   Mon, 6 Mar 2023 19:24:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     linux-usb@vger.kernel.org
From:   Noah Causin <n0manletter@gmail.com>
Subject: Question about f_uac1 gadget
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I was wondering if the f_uac1 gadget supports more than two channels of 
audio.

Noah
