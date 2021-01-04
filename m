Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E024D2E9265
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jan 2021 10:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbhADJOv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jan 2021 04:14:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbhADJOu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Jan 2021 04:14:50 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8444EC061574
        for <linux-usb@vger.kernel.org>; Mon,  4 Jan 2021 01:14:10 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id w17so24620166ilj.8
        for <linux-usb@vger.kernel.org>; Mon, 04 Jan 2021 01:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=on8t4HPXf4Ev98FkYgXxAX+jXFqPPaU40pYhqUMG1JQ=;
        b=dJ5WkvYk/SOJb+dgIAR8WpU4ctW126IjLtuiDdGpoKW1K+esiLjol/8IUBRQjvPVNm
         vg52rUxnq3Wl6jlyRB2tN4d11yzdDKJ8L09KEf3zbpg63aNkuxlblB4FKjjg+DGZB9AW
         EUQOl+F1ZfFxbKhQsvQc7006RE7XEySyeMuQYRP+PHdqZs/jvMri6BQbP61xScTdZpO1
         HA4OFjHXlIMQgT6GZ5+A1VclglJqjNRweLwx83wMBEE2PtvsAYzTNMnpIKj9pLk8gNA8
         G7vpG7mSMOxLoCH8ir3+j9FZVQAokP0Vc/4IJUn6Ht8o93eMiXlHxrjWOfN43czlTyKp
         66Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=on8t4HPXf4Ev98FkYgXxAX+jXFqPPaU40pYhqUMG1JQ=;
        b=Jf4Cp1RX2cOzGDKMiLnsRUxoMHFP0PuBfhP7jvztm5P83nwt+rJn8ARkpzcxEnLj8G
         eN9mpqvp0/uCLES+6zwXSjOOxm4+6XaQQJd3OTVC30NZvIem2Xf064RJ9FnUw4kYU02P
         6BSqtzoj6w6EuUX4c6Dg/lgG38goeqWlf8rI3WG5s5olfV3EJ3S+6hviGUOXEfyXyCRD
         UxK8VRS9+ukZYD6stBcOlCpcbEUwj/WqbmhbLKcRAvt6xkU7OdqBFLkCMmKAnlPnguP2
         zEo+lXOPe2z4qH8RJGqT1zDFcJ4/65EWkXcKBpKiM64QFxknfvXxv7gFsNnQvI0HGvdc
         Q+tQ==
X-Gm-Message-State: AOAM533QBv9JONPYTY+/wyNWbH7UOTZ35mUVGXHFJrd5t6pYZPzm2mVj
        pnK8h5/MWH3kYa3ImDrvPRH9aYjj3IzUMVj+OQSvniaWdOxWsLIv
X-Google-Smtp-Source: ABdhPJxTA7zl8KWRPZdGf+gz8CHzAufbXPuURSOyxTnmYgtzmzcbsCneuloZwyN60I5P3pP9+SdfNQdPQUGB2qsLEyo=
X-Received: by 2002:a92:4089:: with SMTP id d9mr63805076ill.199.1609751649814;
 Mon, 04 Jan 2021 01:14:09 -0800 (PST)
MIME-Version: 1.0
From:   Shawn Guo <shawn.guo@linaro.org>
Date:   Mon, 4 Jan 2021 17:13:59 +0800
Message-ID: <CAAQ0ZWSnUd6S5VX=wRx2o91N_kpkQpgHp8Sf2Q4pqCL9RAHdhA@mail.gmail.com>
Subject: 
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

unsubscribe linux-usb
