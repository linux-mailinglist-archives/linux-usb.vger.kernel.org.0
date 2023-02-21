Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6C369E2EE
	for <lists+linux-usb@lfdr.de>; Tue, 21 Feb 2023 16:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234614AbjBUPBu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Feb 2023 10:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234604AbjBUPBo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Feb 2023 10:01:44 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B07E2B2BD
        for <linux-usb@vger.kernel.org>; Tue, 21 Feb 2023 07:01:42 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id o4so4764812wrs.4
        for <linux-usb@vger.kernel.org>; Tue, 21 Feb 2023 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Cdv8s9JUYzRc9Ts93pJpZXgCJYi7eEemnXjP/YIZMiM=;
        b=ghgNJt/tqY7m/EqvwhSBN8tEuQ+i87zpDgW8251ZKFbbZ+Ot5KAikFRhCY9/6kwkqY
         CSAYieNwA6YzhK0gUT8MNbyeimOMRhNZ5GnNepc0LEswXhFJcB30nQ5tIOCeDv9Wlhkl
         z2tl1I2cmkG0t2zRJNE0MdYNSFRAp2h29JCKtKPbolVFEMQNvl8Zqd7bhQa0PzmnLIEQ
         YcBOrqdiesbIfml3OB6LlqqgAhIif9IPtVyr+iWI3jDylIAKAonOW8zLhdOoQnTM6ANl
         QNZr6aPoGM4BYOq4iCSYbVoiKHzVa15dTydT7spJCiq3MzBl1xu4lYrCGxM9M1mM33ql
         az3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cdv8s9JUYzRc9Ts93pJpZXgCJYi7eEemnXjP/YIZMiM=;
        b=ued1wSgBpRMMZfDZr4HR0M8a8YNeKRrXp5zmNxQB1n0N/rU1nEZcYUsBVOBPRMYYQ6
         WHEz5V7iEbBYRzykc3/xciVAl8A+0kLyqQlvjxZxwiKGp7d7aDvkG7GZHMjqLLRMfzPi
         P9+QLUDTgNHG1kTlqVLMvstjzBi/gB4LvhC9XikH6TZKME/+FrGj852jlLWl/LXMkuvO
         s9naTrE4maVVVsdHfkgXdmfb9kH1yvtlYBzN/KjVdPe8dxELKqhQ4CLXmhE2mYPt8zIq
         FI2tHvM/xe6Rh2KMaV+Yx0KuNcGLunGE4CkZL62fUePzsT+ZR7vR24ifeiQUmtyvTaMw
         3iAA==
X-Gm-Message-State: AO0yUKWE/fh+qebuz7tlLfmYPE+YNEdmsUiZ6sk889o4X1Jj3YaQkSJo
        vBJfPhAN0354ZK/EK90OkAXjLVT48K4=
X-Google-Smtp-Source: AK7set9HTYQ7EoEU0eWFCsoOg+8LGAUa5Yq6exMgkBfOif8l4U5NWioubIb3dSkQL85zb/oO4/hdnA==
X-Received: by 2002:adf:f946:0:b0:2c5:617a:5023 with SMTP id q6-20020adff946000000b002c5617a5023mr4493461wrr.71.1676991701475;
        Tue, 21 Feb 2023 07:01:41 -0800 (PST)
Received: from DESKTOP-L1U6HLH ([39.42.138.70])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d51cb000000b002c5804b6afasm1676651wrv.67.2023.02.21.07.01.39
        for <linux-usb@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 21 Feb 2023 07:01:40 -0800 (PST)
Message-ID: <63f4dcd4.5d0a0220.34a63.50ce@mx.google.com>
Date:   Tue, 21 Feb 2023 07:01:40 -0800 (PST)
X-Google-Original-Date: 21 Feb 2023 10:01:41 -0500
MIME-Version: 1.0
From:   trinii.dreamlandestimation@gmail.com
To:     linux-usb@vger.kernel.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0D=0A=0D=0AIn case you really want take-offs for a developmen=
t project, we ought to be your consultancy of decision. Reach out=
 to us assuming that you have any undertakings for departure whic=
h could utilize our administrations.=0D=0A=0D=0ASend over the pla=
ns and notice the exact extent of work you need us to assess.=0D=0A=
We will hit you up with a statement on our administration charges=
 and turnaround time.=0D=0AIn case you endorse that individual st=
atement then we will continue further with the gauge.=0D=0A=0D=0A=
For a superior comprehension of our work, go ahead and ask us que=
stions .=0D=0A=0D=0AKind Regards=0D=0ATrinidad Pak	=0D=0ADreamlan=
d Estimation, LLC

