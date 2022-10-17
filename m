Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0802E6017F4
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 21:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbiJQTow (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 15:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbiJQTos (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 15:44:48 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9243120BD4
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 12:44:43 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id l5so13293130oif.7
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 12:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CN+vhPEGNqZzmOiuUIghOz2shKeTb0/8p2TGRq9W0p4=;
        b=KRM/FyVcmtY7kQ6FiXhyUsIZVeIZgZhUXes0/Vg4u62zXEGyYeKT9A/l5xeuc0lT8A
         9tITbVezmmMyoNyBKQO8N4WbIsBRX28zlRmQlKwALhSlM0iTH67x6Dabl5ZxzcRhjmxc
         6hlEm0bk7wIxHwKnArDf58B3PpzMoE3fQXfd7a4nXeffTZjNe3v4NyIVTbHM8HKbld4A
         C+/a5HjFYZhM1YncZO0PR8Vgi66lRwchsAOd4AyL1idEowish+wWzHAk5n99j3nOS14X
         LOkFOULQlBbqU58bs7VqG0qznxLJef/Q3ShKKYyj9+tkvf4xIN86w/59O/0J6DHfKsN9
         o1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CN+vhPEGNqZzmOiuUIghOz2shKeTb0/8p2TGRq9W0p4=;
        b=iKQwNYvgfvkhFhwW0uWSktUgp4lUThf6Tfy1tsXgUmrTH+b7piWa5MXqCqOSbKc3/9
         UPZxo0eFBd3HR2xlFHp6c39eZkn4gsrnKDpwXbuAMeGtcXbJhUUi2zJbuKEQWu+1SomV
         7cII5Bx0S/VRv8Wav0/aFxPAxyYyXKuCvrAo14yrfnkYAEiBuBPM7bcIzzm/7pyZ32fR
         znHzQaSXOGh8DQZP4jbDoM4+LHypTfygL5ibHERbO1wakEIpiLMCyTddVk370LKkrJat
         CjMYOBdTx2kKZTQr0MsPI8VxxhV1IjN5H4CT7IK2naiyMPG8dgoeafnJCNDjtm9IuYoD
         G4mA==
X-Gm-Message-State: ACrzQf0sltKfltozUl9/iaJT4GL3L2455tzv1cI1+ZU7HKMJd4fEIXY6
        iuqFE5kNdzwkC3NxlzJv0ezfTQ==
X-Google-Smtp-Source: AMsMyM6CTzJujzzV6ymHF4yQxJJZ9ZgRGVVlL9gc5/FudeV+ftuaEfNiWAu0nDJwIAN9pXcVbzXUWw==
X-Received: by 2002:a05:6808:2226:b0:354:ab07:4f12 with SMTP id bd38-20020a056808222600b00354ab074f12mr5701540oib.234.1666035882924;
        Mon, 17 Oct 2022 12:44:42 -0700 (PDT)
Received: from localhost.localdomain (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id bp9-20020a056808238900b0035474ff66b3sm4741256oib.35.2022.10.17.12.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 12:44:42 -0700 (PDT)
From:   Steev Klimaszewski <steev@kali.org>
To:     fntoth@gmail.com
Cc:     Thinh.Nguyen@synopsys.com, andrew.smirnov@gmail.com,
        andriy.shevchenko@linux.intel.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Revert "usb: dwc3: Don't switch OTG -> peripheral if extcon is present"
Date:   Mon, 17 Oct 2022 14:44:39 -0500
Message-Id: <20221017194439.3829-1-steev@kali.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <887510d7-b732-2b0e-e177-615de59cfaf8@gmail.com>
References: <887510d7-b732-2b0e-e177-615de59cfaf8@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This revert breaks USB on the Lenovo Yoga C630.

sudo cat /sys/kernel/debug/devices_deferred
a800000.usb     platform: supplier 88e3000.phy not ready
88e2000.phy
88e3000.phy
a600000.usb     platform: supplier 88e2000.phy not ready

Nothing seems to indicate there is any breakage in the dmesg output though, just
that deferred probe is pending.

qcom-qmp-usb-phy 88e9000.phy: Registered Qcom-QMP phy
qcom-qmp-usb-phy 88eb000.phy: Registered Qcom-QMP phy
platform a800000.usb: deferred probe pending
platform a600000.usb: deferred probe pending

-- steev
