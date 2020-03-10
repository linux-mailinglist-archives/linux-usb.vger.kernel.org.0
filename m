Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA55C1802E1
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 17:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgCJQLs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 12:11:48 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:39362 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJQLs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Mar 2020 12:11:48 -0400
Received: by mail-lf1-f45.google.com with SMTP id j15so11397161lfk.6
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2020 09:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jFdP6t8S+1zuSDdxP67Jvo+ZEcWT4wDlLc+xNXphJag=;
        b=rSJFUeGyA5pLADkLFSoIo9bdPjAugHkFYx/BWztqeP7KVciTV7BSKo/FT64M0gL4lC
         5SaAdLHx2j5D9f5R0SqV0k/GxxbPTCdB4sraE6vMqhdTJbWd3FQPxrrrt0qDPe0q20Pi
         pNlnRZabZzfoSgI1yQCK65wr8zqEcpj2IZYptlx0Sx9XzOc5+rqLCkMGszfbwUTXQNG0
         aJ1H+6/BMSOzCiDiT4cAeqPq8D2YmYMeBQuYBUQNLZS1TVp34qYyVNWitcT4sEjgnlBB
         JinBS4sfkSi171neCK5wh6uiVk3s7A0R8TUso5jmQetPvig5O4XVgYt8sUvh2oic3c+k
         A7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jFdP6t8S+1zuSDdxP67Jvo+ZEcWT4wDlLc+xNXphJag=;
        b=iM/QJGf67iHf3BrxlA9dexUBXE69h8NXg/7ATMjZHWPua4m+3CD4A1aaTdLDuPwcPv
         74DLR2moXWyRYv4CDZ8yYGkWXdtBzMD7AAfK5t/Gmw/gJhLRqzLQenSygJHjT3XuRBPo
         g2oLotaDoU+r8E4fGTWpZO7vdKolIdCJpwz4Wjem/fqxTLqOB268FGeczZd+LpO/2+xc
         EUVDdtL1GvJbJomWyXkoHG/Ca4rB9Mf++L64rKvaPihYOJTtCTRxD8HB7RB4FXwNjoyH
         xe4ANpEvYYAMRJTbFmOehJiOTfESFIrwbzRhFiSKNXFfXICRoeb/x1FVr9P3qF6oNj2M
         jzuQ==
X-Gm-Message-State: ANhLgQ24QWNqlelu9KN5LtDrWuZWWVKEHn1vVSrudoLBOhjOpApKCY6n
        rQvCaClTVMedqiwj8MAcWZd+tq2u4THWYAU03Ng=
X-Google-Smtp-Source: ADFU+vuwNxEsaZxTh3w69H4G9I0pR0OGITeuiE0beGkIX90yxakTTjPKvZn6LBbYdgkw6OUdO9l1S6LfMpHwBMRMFuo=
X-Received: by 2002:a05:6512:68b:: with SMTP id t11mr13160052lfe.214.1583856704192;
 Tue, 10 Mar 2020 09:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se> <20200303163945.GB652754@kroah.com>
 <ca6f029a57f24ee9aea39385a9ad55bd@actia.se> <6909d182-6cc5-c07f-ed79-02c741aec60b@linux.intel.com>
 <1583331173.12738.26.camel@suse.com> <4fa64e92-64ce-07f3-ed8e-ea4e07d091bb@linux.intel.com>
 <VI1PR04MB532785057FD52DFE3A21ACA88BE30@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <699a49f2f69e494ea6558b99fad23cc4@actia.se> <20200310081452.GA14625@b29397-desktop>
 <d1f68ef3316e484b9cc1360f71886719@actia.se> <1583838270.11582.11.camel@suse.com>
 <1583839306.11582.12.camel@suse.de> <325d5af5d4c44eafac94fc8e0e4d1a7d@actia.se>
 <c671a51d6b5642078367d681643c46af@actia.se>
In-Reply-To: <c671a51d6b5642078367d681643c46af@actia.se>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 10 Mar 2020 13:11:35 -0300
Message-ID: <CAOMZO5BURqWDXKXiwLzG=BRC_wJkjZ1d_HaLt_tefjk3GrabDw@mail.gmail.com>
Subject: Re: USB transaction errors causing RCU stalls and kernel panics
To:     Jonas Karlsson <jonas.karlsson@actia.se>
Cc:     Oliver Neukum <oneukum@suse.de>, Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jonas,

On Tue, Mar 10, 2020 at 1:07 PM Jonas Karlsson <jonas.karlsson@actia.se> wrote:

> I have also _reverted_ this patch after recommendation from NXP to avoid RCU stall
> crashes:
>
> commit 077506972ba23772b752e08b1ab7052cf5f04511
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Mon Jul 9 13:47:30 2018 -0700
>
>     rcu: Make need_resched() respond to urgent RCU-QS needs

Could you please test without this revert?

Thanks
