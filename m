Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C58292659
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 13:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbgJSL1s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 07:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgJSL1r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Oct 2020 07:27:47 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 980D9C0613CE
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 04:27:47 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id k25so12465635ioh.7
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2020 04:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=lnnlmXT2smNsFULtRy5NWN+lEjO92ZjkCQFdwtEXrZs=;
        b=jOS6tTX/dteBzHOHrNsWD7V5IM6mqVgehEoSffj1cvPCKBMd5fz5Ecnex8OzALQ7g/
         iGF/hbTd4VB/GNoROzCswB5hKtRp8f3UxDhdC/RnnM+o5bUd2bAcgE4HZNBJg2jB/Eai
         +eX7Ob47tOLapfAB52lgJuPGs9G92JJF57EWzYCYzz1yXfW4CtByL9IUk26LLBbAFPjW
         4Er9asTfMe7LGazwRVnmYXF/OBYlKzBqOAna9DRfBG7KvEq3Jf8b19BrwmGjzcr8FWZf
         XmO+tcHUd1fCZ6DOjiNuTj0Aju2OyUO+Ck3jZDkHTwLqvIBZdAaL+QSzTEvzFS8+0Rw/
         zEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=lnnlmXT2smNsFULtRy5NWN+lEjO92ZjkCQFdwtEXrZs=;
        b=sxLzmvA5J/62b5HaqyDYWn8Q3pOwAjd9HglOEeSJIKb4Hc9/rm3ukSf8YymChodISI
         pj07HvNyFLlEqYmap+wH+NwPkN5SP+F/20/qVHrxRZltEvD8OOEc7VUt7Hgb00Spfl7V
         M7MBjT+zcria+PhY44VoZxd9RHjnLAQiNtzK2szajIrRunpDPs2p4uNh7UbFT3pHq9B2
         FQ3ytKQLcioniMQwghnUxPf0k0kFl9hg7cNzB9la+a6NuZuWtoJUbDnzlTKAoAuRsv0T
         IWKr7gamwmUFEPnmuHaZOwDX9LzdHeiJ6TJD4aQq5af5EmkpRgbwRMt7qS/tvFZmz1cI
         SUZw==
X-Gm-Message-State: AOAM531fuBncs2eHiNbUVLX1+CSpz8zsqzRme/1xlPSxoRHwij9S0+bK
        YW7lLW2x1EkQOUbJErxbwFe0uqQHdLS5Qtrf1gJ/aeNbVoFkNA==
X-Google-Smtp-Source: ABdhPJzveoyBFOay0UBHOPvGZKKhXwKuYko1dpBBmi925fDP4InqNgdqUFJ9PNbX+j9bbKMwKMr5vctAsr6d3p3EI8c=
X-Received: by 2002:a6b:8e08:: with SMTP id q8mr9962921iod.83.1603106866799;
 Mon, 19 Oct 2020 04:27:46 -0700 (PDT)
MIME-Version: 1.0
From:   "Dmitry N. Mikushin" <maemarcus@gmail.com>
Date:   Mon, 19 Oct 2020 13:27:35 +0200
Message-ID: <CAGR4S9HQiZCsA7Y5_47j-xBOkydKiT2Exam=36L=-vwRjt+UWA@mail.gmail.com>
Subject: Any example of USB gadget for DRD device mode on Intel Gemini Lake?
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear All,

I'm confused by the USB gadget mode on the recent Intel SoCs, such as
Gemini Lake. The /sys/class/udc is empty, and a SoC can't present
itself as a IoT gadget this way, yet definitely being designed as
such. I've noticed the concept of dual-role-device, which seems to
replace the OTG. Particularly, Harry Pan mentioned that Gemini Lake
supports DRD in port 0.

Indeed, if I do:

sudo sh -c "echo device >/sys/class/usb_role/intel_xhci_usb_sw-role-switch/role"


then one of the ports gets successfully recognized as a new USB
device, if connected with a cable to another laptop.

But I'm wondering, how exactly could I construct a logical device
class for this case, e.g. similarly to uvc gadget for OTG? Completely
lacking any example of code, currently it's a big confusion.

Thanks & Kind regards,
- Dmitry.
