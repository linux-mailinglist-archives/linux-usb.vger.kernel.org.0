Return-Path: <linux-usb+bounces-30826-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AE9C7D102
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 13:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D84034E621B
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 12:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5B72FF149;
	Sat, 22 Nov 2025 12:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU5c4AUL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657232F90E0
	for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763816092; cv=none; b=qqmfvwMn571y89+MZVxjylAu3QVdEaNxCNsCTddx5Z/RZ29FMZrQ7eDCY1UtMAAXlEPbdtj/jD8s2w+2K5Eya0nOFpV10eaAbbNd4LTVVrWV9M7InEgVuerSIIiI8zcNf2s2gGsK6nAFySXF9kNM4Fi9YKPF/WB7JhtODENZlv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763816092; c=relaxed/simple;
	bh=bkp4DUpPBDa287pRI6GNWPOdwI6zaKAZ7/ojyNVDXk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+jbLHiNi+IRETBybb7wshoujq0CGY9ddnoqX5f7HQVRHucETrFM4vFqFxSFVXx0/q8N7ctSYX9h5k1iyM+tYCPVHMbHMtd7IECaPeInIuydLQt1WjyrKu9kbMsAJTHoqVfBlaj3ayH7bCzqlxpor4xPp6LCjpCqim4WiUxu0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU5c4AUL; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-786a822e73aso29771727b3.3
        for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763816085; x=1764420885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZwoDBE6Pzt16fbZQBG6bVHte66dscme1w5h0bjPBek=;
        b=IU5c4AULSew8nhh1waIlsgsFJTtDzLxC/SS/erV64wWBTmxyNV3dOLyf2ws4vmj0VT
         GRSsCFkfBJlCE+MteizJc7g5VFYtBZy2PMDCQ2vLRREgQXyfYVt9OvpU8B0i9d+xYrin
         o6eYAo4fUohLbEHBr7+WnYgKiS/tpC0JJ9UMn/BPkXgYpVXBJhpNjeE3ntLHc9qhSqKf
         NSlzlVYI/0a55BSZi5+cf6KH8sNF9GZka+NNnFidj8NcoySGU8RBtEfmMaKeYKGgAjKI
         u9BQmgrxvTQuv8uRTfq5Y5GP/vQsedXKSX0Sxmb3DzZ9ll1IeGqUg2BtBR2eUyspeZel
         F/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763816085; x=1764420885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ZwoDBE6Pzt16fbZQBG6bVHte66dscme1w5h0bjPBek=;
        b=kli1tsq7QEDmb15InqPQcFYjT20gfqI2DSrCvOlYHKLFwjXcx8nE7jCjzMQTDXLhvD
         AGOpbEmaX4lOunOzwT0r6O/+84bCqiWQDKiPJMn/7laxGVAZDDMnQBDRlm0cyCqdNFsc
         5a9gDcDrTqlnVrg2rAtdOs2LnIcYEehXFUHY04+02k9vrFnxCSQUdv71NR0IQidjZWwu
         3nIftxl9SSk0dSVWx+RiwxXYWpM3EbotFZuV+OAd3ZQufPElg42xIc2KlMhOZcKR0LCw
         npfQO2sT+ts1sAsrkLpyuIxCXYj3VrQjDjR+UrZAz7Y/V0ILswx3/8k1UuMIV4XJXPtk
         62fQ==
X-Gm-Message-State: AOJu0YyVm+s5Adlo3ZYFbQs/fOFvyK8gXahSCSoRWFeYJ7O3r/0xcqDA
	o/mhjqZeUr1y/YA5H3e6IxMKj6yqC3iVsjVK5zMv//m61sInrYp4Gx73cvJZj5Gc8ajJT0v5y5z
	r+TtZ+asdrG2o1RzbViDt/3RYrLBIWCs=
X-Gm-Gg: ASbGncu23XQYhCFEv01soUv3UJJFI+OqsidudLQiHxUXgxQxQ6ey7cCxKHHuRf+B1JP
	+ZPPAT+oOTLfj0IHsPRMYoS+bwIlj1OvIkZ43qDzOX+WakcHYzdt6qQDhY5rJxXdrH40Pr1s+A/
	qsvHs2wKH/RivL/0CBglkquqTms1PMD0X9wt5TqBFeDeySU63TSspecq72Q5Gc8HWOwys4ISwyV
	Ee1+bHefCiSaNZf8PbIv2LRDzAa0gFR0MEXEXdlpROhF40IITXNP1g/9xbj1uLQye19dgri
X-Google-Smtp-Source: AGHT+IEt1QTAZ3wks1YhvWeaHyNH8BiJnzLXWkhTE2CJY8s2e9Xquhk62bQFDGywnzv50jNz9Db24XO1LOAfg75RW1g=
X-Received: by 2002:a05:690c:3391:b0:784:aec5:7042 with SMTP id
 00721157ae682-78a8b52683fmr40974137b3.38.1763816085170; Sat, 22 Nov 2025
 04:54:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122112539.4130712-1-jerry.xzq@gmail.com> <2025112253-quintuple-colossal-fcbb@gregkh>
 <CAD48c-Vp0gJZpBu0BobooWjKBksNJ+CcCTQRw1mzspoO2Zs5yA@mail.gmail.com> <2025112206-handwork-hush-5886@gregkh>
In-Reply-To: <2025112206-handwork-hush-5886@gregkh>
From: jerry xzq <jerry.xzq@gmail.com>
Date: Sat, 22 Nov 2025 20:54:34 +0800
X-Gm-Features: AWmQ_blZGyvjrb_MxdzTWu5xMTABnjrQTcwgebZkfFSi-7PjnAhHmy9j_1s51f4
Message-ID: <CAD48c-UtXWpOemuuVnKAf64_7yDMVCz9XYzpH9NNx_Z9Fq3d0w@mail.gmail.com>
Subject: Re: [PATCH] USB: of: filter disabled device node
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	treapking@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 8:32=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Nov 22, 2025 at 07:49:02PM +0800, jerry xzq wrote:
> > On Sat, Nov 22, 2025 at 7:32=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Sat, Nov 22, 2025 at 07:25:39PM +0800, Zhengqiao Xia wrote:
> > > > We should not point the of_node of a USB device to a disabled devic=
etree
> > > > node. Otherwise, the interface under this USB device will not be ab=
le
> > > > to register.
> > >
> > > Why would a USB device point to a disabled device tree node?  Shouldn=
't
> > > the device tree be fixed instead?
> >
> > According to your suggestion, when a USB device is directly connected
> > to a USB port,
> > we should delete the unused USB hub node instead of disabling it?
>
> Why are you using device tree to describe USB devices at all?  What is
> the root problem here that you are trying to solve?

Our device follows a public board that has a USB hub, which is
described in dtsi as a USB hub node.
However, our device only has a USB device, not a USB hub, so I
disabled the USB hub node in our device's DTS.
&xhci3 {
        status =3D "okay";

        /* 2.x hub on port 1 */
        usb_hub_2_x: hub@1 {
                compatible =3D "usbbda,5411";
                reg =3D <1>;
                vdd-supply =3D <&pp3300_s3>;
                peer-hub =3D <&usb_hub_3_x>;

----->         status =3D "disabled";

                ports {
                        #address-cells =3D <1>;
                        #size-cells =3D <0>;
                        port@1 {
                                reg =3D <1>;
                                usb_hub_dsp1_hs: endpoint { };
                        };
                        port@2 {
                                reg =3D <2>;
                                usb_hub_dsp2_hs: endpoint { };
                        };
                        port@3 {
                                reg =3D <3>;
                                usb_hub_dsp3_hs: endpoint { };
                        };
                        port@4 {
                                reg =3D <4>;

                                /* On-board WWAN card */
                                usb_hub_dsp4_hs: endpoint { };
                        };
                };
        };
Then, during use, it was discovered that the LTE device's of_node
pointed to the hub(hub@1).
However, due to the existence of this piece of code,  USB interface
cannot be registered.

if (intf->dev.of_node &&
!of_device_is_available(intf->dev.of_node)) {
dev_info(&dev->dev, "skipping disabled interface %d\n",
intf->cur_altsetting->desc.bInterfaceNumber);
continue;
}

When the upgrade program for an LTE device calls the USB character device,
because this LTE interface was not registered, a null pointer
exception was encountered, causing a restart.

please refer to
https://lore.kernel.org/all/20251114141821.416835-1-xiazhengqiao@huaqin.cor=
p-partner.google.com/

>
> The use of USB in DT should be _VERY_ limited, if at all.  You should
> only do so for very good reasons in very limited situations.  If this
> starts to get abused, we'll just have to rip it all out :(
>
> thanks,
>
> greg k-h

thanks.

