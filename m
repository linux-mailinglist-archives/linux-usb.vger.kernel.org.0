Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 637406A0B95
	for <lists+linux-usb@lfdr.de>; Thu, 23 Feb 2023 15:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234074AbjBWOM3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Feb 2023 09:12:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbjBWOM2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Feb 2023 09:12:28 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8F0570A2
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 06:12:27 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id b16so4299066iof.11
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 06:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p3CixMn8o5coVJaBVcuZteyvHBIoOkyvArQTFLl5Ks4=;
        b=Xiq3SQhzZfIrcjavmZX/I0/fhs+tZJGEnNWd2PWKAdOSwL2oXKjd7QGItuGjh/i8V3
         6aJRNdE4e4Y3N52Pvd4N5ehAb6dmIJX4UPZstwC27Mca3hMV25YPCQM7xtKBDspNrqL4
         tnwXLNSJ3FoCeG6p9pyJDP9tNHE60zYXlpW8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3CixMn8o5coVJaBVcuZteyvHBIoOkyvArQTFLl5Ks4=;
        b=O+feyX1Q7IMarxku9Oc59c17pE/OtyEQf9OLmKO8xU7wfT4U1VfkxNpGNUMzlfYlyj
         2RCsQuf3tzXGeet+jSsKaladeHUGFklVaWNKPmElOoqWARrL6wJ090oHeu2rJUOBtvsE
         tcrNfcxrTl+ywJVKNylNENWVgKYcWnuKJdDAwIDCanNa0O9jjlBDiNlCrFOl7ETWMDkE
         w7FSjwb9XxxQZm/K59WIMxjuHNa7uJ8gTx8Izdr/0zPVYvQgA13mpbYu1JfbwlM5c5q4
         exKXVRfudvyGj1O7pKwoxsHi+NL5YN5I3Wq7Lu2gzU9mejvlA/NYVwyJvIuzs4o513mB
         UckA==
X-Gm-Message-State: AO0yUKUuPFFl7aCc30IfuSWdcW38hLKo9esFoh2UakyWUumeU+mrZPrP
        gy0Uh7WydwkP3swyydKLRt/1IQ==
X-Google-Smtp-Source: AK7set/AxMedPc4AQTS0JZTAyleWnfZ/v5D2kKdQNOXEw8nG6xg1281g+GiuetM5GTanKE/5FlXelg==
X-Received: by 2002:a5d:9306:0:b0:71a:1b72:5afc with SMTP id l6-20020a5d9306000000b0071a1b725afcmr3157849ion.19.1677161546450;
        Thu, 23 Feb 2023 06:12:26 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id w15-20020a02cf8f000000b003b331f0bbdfsm2883337jar.97.2023.02.23.06.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 06:12:25 -0800 (PST)
Date:   Thu, 23 Feb 2023 14:12:25 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anand Moon <linux.amoon@gmail.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Icenowy Zheng <uwu@icenowy.me>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: misc: onboard-hub: add support for Microchip
 USB2517 USB 2.0 hub
Message-ID: <Y/d0SWMjh2oFFZ4+@google.com>
References: <20230223073920.2912298-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230223073920.2912298-1-alexander.stein@ew.tq-group.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 23, 2023 at 08:39:20AM +0100, Alexander Stein wrote:
> Add support for Microchip USB2517 USB 2.0 hub to the onboard usb hub
> driver. Adopt the generic usb-device compatible ("usbVID,PID").
> This hub has the same reset timings as USB2514, so reuse that one.
> There is also an USB2517I which just has industrial temperature range.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Matthias Kaehlcke <mka@chromium.org>
