Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E52446E9A38
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 19:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjDTREC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Apr 2023 13:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjDTREB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Apr 2023 13:04:01 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB36B199A
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 10:04:00 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-329465f10fbso2903465ab.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682010240; x=1684602240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8mJL0d9vr9ZMqt2nsQXvO4n6NRmaGu7wVWuPusp7OU=;
        b=O0bvq1g6d5Zqedpj0m9GpJiex3tmJl74acKFlPsBvcG9KuiAxbXn2sdE9c0id/Q4cG
         zuV7Gc8Uoa4QYKK7B0jdi4ETxqYQyun5BqrATGjx4abl0LTKvmCDDbG5H3YhmpVXqdv3
         qgVA8tR+R63yMIZg373+HhYF+Kw5CIUk/2rh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682010240; x=1684602240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8mJL0d9vr9ZMqt2nsQXvO4n6NRmaGu7wVWuPusp7OU=;
        b=h4HBwKt+NRlqRrIafwOzQsFTdjEbBynv0QBAk34+L/IN6whEIncElXvAfvUg8PCuRT
         300IY0N1qZnpMsYMO6OwqldkFtteeJ7/VNIatbLOBD9WSwYYHXnYOa2HnFIYNz5CN5LL
         uTBea7ny0l4GSNthVrlFpL6dNMS4yLQQuszfVjrzOJa8uF8wcw3HvaA3q9NGK/Kt+Ikw
         R7kzUPe8tbuEuVd4ofQkREQJN8rXhuqF3+xF5/09We1FVMjULibcKVDYtJR27Mal0ySY
         DQtpJmXs40WGbObas3h9faqf464eVuL36DXTVTovtRHXx2Jgz85GqRKXQC8QNX5bSsj3
         c+Qw==
X-Gm-Message-State: AAQBX9cAxYX53vYmszR38oQ7p0WOoqk34u2BERLHF4wkVXm59bVRZY10
        tI81t0MUMvbBtiP/oc5E4Wa/5Q==
X-Google-Smtp-Source: AKy350aFZGvueWnqgmMl5LP3VU0hllTFY0LWWd33hFcYuSpLUWskYD/GNjfYFf3UvKWHDwciUqEtZg==
X-Received: by 2002:a92:c990:0:b0:328:f4e8:8cfa with SMTP id y16-20020a92c990000000b00328f4e88cfamr1504538iln.32.1682010239994;
        Thu, 20 Apr 2023 10:03:59 -0700 (PDT)
Received: from markhas1.corp.google.com ([100.107.108.205])
        by smtp.gmail.com with ESMTPSA id g11-20020a92520b000000b003291bea8c7fsm515292ilb.81.2023.04.20.10.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 10:03:59 -0700 (PDT)
From:   Mark Hasemeyer <markhas@chromium.org>
To:     basavaraj.natikar@amd.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        mathias.nyman@intel.com, stern@rowland.harvard.edu
Subject: Re: [PATCH 2/2] xhci: Improve the XHCI resume time
Date:   Thu, 20 Apr 2023 11:03:37 -0600
Message-ID: <20230420170337.14110-1-markhas@chromium.org>
X-Mailer: git-send-email 2.40.0.396.gfff15efe05-goog
In-Reply-To: <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
References: <20230418140817.3651909-3-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> It may be necessary to wait only for auto-resume cases.

I find this comment misleading as the patch assumes that it's only necessary to
wait for auto-resume cases. Are there any cases where the driver should wait
during system-resume?

Also, the commit title could specifically mention "system resume".
