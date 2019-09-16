Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1DD7B4282
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 22:53:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbfIPUxv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 16:53:51 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39055 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfIPUxv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 16:53:51 -0400
Received: by mail-io1-f66.google.com with SMTP id a1so2342337ioc.6
        for <linux-usb@vger.kernel.org>; Mon, 16 Sep 2019 13:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HGutlHjL1hPcJfVETM7yg8zwMasPzYpZhM02tt4Go24=;
        b=u0aWmW+DoQ6SEeBAEAw9YvDS7lFV3IV17Aj10/hlJhIcQIy03Jj3mutkOg4mbfP03G
         iDQIT9awnoyaIfCpMueWzF/1wdrRcnHtuQVBU1+WauZKwVE/AIaQK5fvV8anSVQNSCg2
         cWrDxUlxCASFPezCklO9OvutH5bvzWpgBpSOY5oY8Sn6BNFY8uRUuKWdiOELtzJWumZT
         7wqBKejgtFTRlNk7/9sF7tvqdrldKxYT/gayaiJeL1mrPZ4/aOr8rlGR5bq7akAZ1y0X
         wBK3RQYLGPniwuC6sL5MzLvTJBTD5E00h6f5YPFeuKFSjDFH2d4kPGch6bVxkRWXS2NR
         r4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HGutlHjL1hPcJfVETM7yg8zwMasPzYpZhM02tt4Go24=;
        b=BdtysBIcgHiJz9PPcX8HDmaCojsaiXPHaJLH+5Ae2y+bVW2gOqDhS2mCLLIlMXviTV
         meRTRmQjCKUBp9XxvuVM2cncR/dNTMSHcI/tPDsT+0jO/m9nirSySX1XdgvvgFlfjrtq
         017xk+bseYLSAjbCWNLMfoK8KipSoFUVhuj8NOn0SzLPwz91fGFao2Jolk4+SavRKrpE
         Cswx0TEzDehVR9mCETE3Wra2lKt+ZgOechRll1XzmXrHs0FSkQx9Z3cHAgd7F+Uw0t9F
         iQy6LWijRaoZLVEqaOQwtPjDDt3MATx4sU3lGYE4Gh4/Bn3J4PMKxmIPnL6bQoUPT+/c
         5v6Q==
X-Gm-Message-State: APjAAAWMKWkmokj9vXGc2SG6IwSG4IRpg3rHp0Ci8UDBM8ktW13kqgBR
        BMTZ6IxI0jxKXByJ3I+nreeqZa1mLxIO7Dl/n50=
X-Google-Smtp-Source: APXvYqxRDdH5VNodPNmIZ4l+i7zGDQW70DiruM9n3uX0tT8li60VMp4jk2Cqou9JjchOzt8nO/KyKzBASmnEC2eN0nw=
X-Received: by 2002:a02:1ac5:: with SMTP id 188mr406724jai.71.1568667230682;
 Mon, 16 Sep 2019 13:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <CANMwUkjb7sCTQKjZG8Dxgta=WrNFc4eRLnCtdbxCx_MJd93oYA@mail.gmail.com>
 <38c06b3b-d9b3-a175-9fb9-7d13f0501490@linux.intel.com> <CANMwUkj5kyxE21fDutTyPnW9vibpYwG_602YFO6tB=Mkr8905w@mail.gmail.com>
In-Reply-To: <CANMwUkj5kyxE21fDutTyPnW9vibpYwG_602YFO6tB=Mkr8905w@mail.gmail.com>
From:   =?UTF-8?Q?Lo=C3=AFc_Yhuel?= <loic.yhuel@gmail.com>
Date:   Mon, 16 Sep 2019 22:53:39 +0200
Message-ID: <CANMwUkjWY0cNV9dJ1YWN+_9LBZb=Wcws7Vw52bR6CBMKyfTTJQ@mail.gmail.com>
Subject: Re: No SuperSpeedPlus on ASM2142
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Le lun. 16 sept. 2019 =C3=A0 17:19, Lo=C3=AFc Yhuel <loic.yhuel@gmail.com> =
a =C3=A9crit :
>
> > Most reliable way of checking the current actual port speed is reading =
protocol speed id
> > from the ports PORTSC register port-speed field.
> > Use debugfs: (with your correct pci address and port number)
> Currently I have "PortSpeed:4" which matches with the "Gen 1" trace.
> If I even get a "Gen 2" trace again, I will check.
>
Even after several reboots into Linux, I was still getting "Gen 1" /
"PortSpeed 4".
So I tried booting into Windows, HWinfo64 showed "Gen 2", then
rebooting into Linux.
Then I got "Gen 2" / "PortSpeed: 5" on a 5.3 with the revert, or 5.0 kernel=
.
With the Fedora 5.2.14, it was "Gen 1" / "PortSpeed: 5".
But performance was still the same as Gen 1.
Reboot of poweroff didn't change anything.

So I tried to play with the BIOS "Fast boot" option, even if it always
lists the USB drives.
I rebooted into Windows, HWInfo64 showed Gen 2, I did a performance test wh=
ich
returned 510MB/s.
Then I rebooted into Linux, which then showed "Gen 1" / "PortSpeed: 4", but=
 the
performance was now good ! Even after several reboots, or toggling
"Fast Boot" on/off,
it didn't change : PortSpeed 4, but performance showing 10 Gbps was working=
.

Then I tried powering off, unplugging AC and the USB cable, then
booting without it.
On plug, it was detected as "Gen 2", PortSpeed was 5, and performance was g=
ood.
After a reboot (so device plugged on boot), still the same.
After a poweroff, still the same.

So I really don't know how to make sense of this.
Perhaps a register of the xhci controller had a bad value kept even
after a poweroff
due to the standby +5V, and was reset either by the BIOS or Windows at
some point.
But that doesn't explain why the PORTSC value was many time incoherent with=
 the
performance, in both ways.

Btw, I found another problem on resuming the system after a suspend :
[  137.029272] pcieport 0000:00:01.1: PME: Spurious native interrupt!
...
[  137.129618] xhci_hcd 0000:08:00.0: WARN: xHC restore state timeout
[  137.129624] xhci_hcd 0000:08:00.0: PCI post-resume error -110!
[  137.129625] xhci_hcd 0000:08:00.0: HC died; cleaning up
[  137.129633] PM: dpm_run_callback(): pci_pm_resume+0x0/0x90 returns -110
[  137.129636] PM: Device 0000:08:00.0 failed to resume async: error -110
Then a "echo 1 > remove, then "echo 1 > ../rescan" on sysfs got it back.
This is a completely different issue, but at least, I can reproduce
this one reliably.
